require './db/mysql_connector.rb'

class Item
  attr_accessor :name, :price, :id, :category
  
  def initialize(name, price, id, category = nil)
    @name = name
    @price = price
    @id = id
    @category = category
  end


  #METHOD FOR INDEX / MAIN PAGE
  def self.get_all_items
    client = create_db_client
    raw_items = client.query("SELECT i.id, i.name, FORMAT(i.price,0) as price FROM menu_items i")
    items = Array.new
    raw_items.each do |data|
      item = Item.new(data['name'], data['price'], data['id'])
      items.push(item)
    end
    items
  end


  #METHOD FOR CREATE
  def self.get_all_categories
    client = create_db_client
    raw_categories = client.query("SELECT * FROM categories")
    categories = Array.new
    raw_categories.each do |data|
      category = Category.new(data['name'], data['id'])
      categories.push(category)
    end
    categories
  end

  def self.create_new_item(name, price, category_id)
    client = create_db_client
    client.query("INSERT INTO menu_items (name, price) VALUES ('#{name}', #{price})")
    client.query("INSERT INTO item_categories (item_id, category_id) VALUES (#{client.last_id}, #{category_id})")
  end

  #METHOD FOR READ/SHOW & DELETE
  def self.get_item_details(item_id)
    client = create_db_client
    raw_details = client.query("SELECT i.name, i.price, i.id, c.name AS category
      FROM menu_items i 
      LEFT JOIN item_categories ic ON i.id = ic.item_id 
      LEFT JOIN categories c ON c.id = ic.category_id 
      WHERE i.id = #{item_id}
      ORDER BY i.id")
    item_details = Array.new
    raw_details.each do |data|
        item = Item.new(data['name'], data['price'], data['id'], data['category'])
        item_details.push(item)
    end
    item_details
  end


  #METHOD FOR UPDATE/EDIT
  def self.update_item(name, price, category_id, item_id)
    client = create_db_client
    client.query("UPDATE menu_items SET name = '#{name}', price = #{price} WHERE id = #{item_id}")
    client.query("UPDATE item_categories SET category_id = #{category_id} WHERE item_id = #{item_id}")
  end


  #METHOD FOR DELETE
  def self.delete_item(item_id)
    client = create_db_client
    client.query("DELETE FROM menu_items WHERE id = #{item_id}")
    client.query("DELETE FROM item_categories WHERE item_id = #{item_id}")
  end
end