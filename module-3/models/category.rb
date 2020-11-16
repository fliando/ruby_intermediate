require './db/mysql_connector.rb'

class Category
	attr_accessor :name, :id, :items
	
	def initialize(name, id, items = nil)
		@name = name
		@id = id
		@items = items
	end

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

	def self.create_new_category(name, id)
		client = create_db_client
		client.query("INSERT INTO categories (name, id) VALUES ('#{name}', #{id})")
	end

	def self.get_category_details(category_id)
		client = create_db_client
		raw_details = client.query("SELECT c.name, c.id FROM categories c WHERE c.id = #{category_id}")
		items = get_category_items(category_id)
		category_details = Array.new
		raw_details.each do |data|
			category = Category.new(data['name'], data['id'], items)
			category_details.push(category)
		end
		category_details
	end

	def self.get_category_items(category_id)
		client = create_db_client
		raw_items = client.query("SELECT i.name
			FROM menu_items i
			LEFT JOIN item_categories ic ON i.id = ic.item_id 
			LEFT JOIN categories c ON c.id = ic.category_id 
			WHERE c.id = #{category_id}
			ORDER BY c.id")
	end

	def self.update_category(name, category_id)
		client = create_db_client
		client.query("UPDATE categories SET name = '#{name}', id = #{category_id} WHERE id = #{category_id}")
	end

	def self.delete_category(category_id)
		client = create_db_client
		client.query("DELETE FROM categories WHERE id = #{category_id}")
		client.query("DELETE FROM item_categories WHERE category_id = #{category_id}")
	end
end
