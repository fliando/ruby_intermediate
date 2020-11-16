require './models/item.rb'
require './models/category.rb'

class ItemController

  def show_navigation
    renderer = ERB.new(File.read("./views/navigation.erb"))
    renderer.result(binding)
  end
    
  def show_all_items()
    items = Item.get_all_items()
    renderer = ERB.new(File.read("./views/items/index.erb"))
    renderer.result(binding)
  end

  def show_all_categories()
    categories = Category.get_all_categories()
    renderer = ERB.new(File.read("./views/items/create.erb"))
    renderer.result(binding)
  end

  def create_new_item(params)
    name = params['item_name']
    price = params['price']
    category_id = params['category']
    Item.create_new_item(name, price, category_id)
  end

  def get_item_details(params)
    item_id = params['id']
    item_details = Item.get_item_details(item_id)
    renderer = ERB.new(File.read('./views/items/read_show.erb'))
    renderer.result(binding)
  end

  def edit_item(params)
    item_id = params['id']
    items = Item.get_item_details(item_id)
    categories = Category.get_all_categories()
    renderer = ERB.new(File.read('./views/items/update_edit.erb'))
    renderer.result(binding)
  end

  def update_item(params)
    name = params['item_name']
    price = params['price']
    category_id = params['category']
    item_id = params['id']
    Item.update_item(name, price, category_id, item_id)
  end

  def show_delete_item(params)
    item_id = params['id']
    items = Item.get_item_details(item_id)
    renderer = ERB.new(File.read('./views/items/delete.erb'))
    renderer.result(binding)
  end

  def delete_item(params)
    item_id = params['id']
    items = Item.get_item_details(item_id)
    Item.delete_item(item_id)
  end
end

