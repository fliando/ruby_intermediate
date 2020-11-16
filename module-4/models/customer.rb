require './db/mysql_connector.rb'

class Customer
  attr_accessor :name, :phone, :id
  
  def initialize(name, phone, id)
    @name = name
    @phone = phone
    @id = id
  end

  def self.get_all_customers
    client = create_db_client
    raw_customers = client.query("SELECT customers.id, customers.name, customers.phone FROM customers")
    customers = Array.new
    raw_customers.each do |data|
      customer = Customer.new(data['name'], data['phone'], data['id'])
      customers.push(customer)
    end
    customers
  end
end