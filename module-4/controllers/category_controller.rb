require './models/item.rb'
require './models/category.rb'

class CategoryController
  
  def show_all_categories()
    categories = Category.get_all_categories()
    renderer = ERB.new(File.read("./views/categories/index.erb"))
    renderer.result(binding)
  end

  def new_category_form()
    categories = Category.get_all_categories()
    renderer = ERB.new(File.read("./views/categories/create.erb"))
    renderer.result(binding)
  end

  def create_new_category(params)
    category_name = params['category_name']
    category_id = params['category_id']
    Category.create_new_category(category_name, category_id)
  end

  def get_category_details(params)
    category_id = params['id']
    category_details = Category.get_category_details(category_id)
    renderer = ERB.new(File.read('./views/categories/read_show.erb'))
    renderer.result(binding)
  end

  def edit_category(params)
    category_id = params['id']
    categories = Category.get_category_details(category_id)
    renderer = ERB.new(File.read('./views/categories/update_edit.erb'))
    renderer.result(binding)
  end

  def update_category(params)
    category_name = params['category_name']
    category_id = params['id']
    Category.update_category(category_name, category_id)
  end

  def show_delete_category(params)
    category_id = params['id']
    categories = Category.get_category_details(category_id)
    renderer = ERB.new(File.read('./views/categories/delete.erb'))
    renderer.result(binding)
  end

  def delete_category(params)
    category_id = params['id']
    categories = Category.get_category_details(category_id)
    Category.delete_category(category_id)
  end
end