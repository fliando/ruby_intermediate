require 'mysql2'
require './item'
require './category'


#CONNECT TO DB
def create_db_client
    client = Mysql2::Client.new(
        :host => '127.0.0.1',
        :username => 'fliando',
        :password => ENV['db_password'],
        :database => ENV['db_name']
    )
    client
end


#METHOD FOR INDEX / MAIN PAGE
def get_all_items
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
def get_all_categories
    client = create_db_client
    raw_categories = client.query("SELECT * FROM categories")
    categories = Array.new
    raw_categories.each do |data|
        category = Category.new(data['name'], data['id'])
        categories.push(category)
    end

    categories
end

def create_new_item(name, price, category_id)
    client = create_db_client
    client.query("INSERT INTO menu_items (name, price) VALUES ('#{name}', #{price})")
    client.query("INSERT INTO item_categories (item_id, category_id) VALUES (#{client.last_id}, #{category_id})")
end


#METHOD FOR READ/SHOW & DELETE
def get_item_details(item_id)
    client = create_db_client
    raw_details = client.query("SELECT i.name, i.price, i.id, c.name category 
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
def update_item(name, price, category_id, item_id)
    client = create_db_client
    client.query("UPDATE menu_items SET name = '#{name}', price = #{price} WHERE id = #{item_id}")
    client.query("UPDATE item_categories SET category_id = #{category_id} WHERE item_id = #{item_id}")
end


#METHOD FOR DELETE
def delete_item(item_id)
    client = create_db_client
    client.query("DELETE FROM menu_items WHERE id = #{item_id}")
    client.query("DELETE FROM item_categories WHERE item_id = #{item_id}") 
end


def get_all_item_with_categories
  client = create_db_client
  raw_details = client.query("SELECT i.id, i.name, FORMAT(i.price,0) AS 'price', c.name AS 'category_name', c.id AS 'category_id'
  FROM menu_items i
  LEFT JOIN item_categories ic ON ic.item_id = i.id
  LEFT JOIN categories c ON c.id = ic.category_id")
  items = Array.new
  raw_details.each do |show|
      category = Category.new(show['category_name'], show['category_id'])
      item = Item.new(show['name'], show['price'], show['id'], category)
      items.push(item)
  end

  items
end
