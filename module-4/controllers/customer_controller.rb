require './models/customer.rb'

class CustomerController
  
  def show_all_customers()
    customers = Customer.get_all_customers()
    renderer = ERB.new(File.read("./views/customers/index.erb"))
    renderer.result(binding)
  end
end