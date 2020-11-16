require 'sinatra'
require './controllers/item_controller.rb'
require './controllers/category_controller.rb'


get '/' do
	controller = ItemController.new
	controller.show_navigation()
end


# route to show all items
get '/items' do
	controller = ItemController.new
	controller.show_all_items()
end

# route to show create item form with ability to select category
get '/items/create' do
	controller = ItemController.new
	controller.show_all_categories()
end
	
# route to create item
post '/items/submit_create' do
	controller = ItemController.new
	controller.create_new_item(params)
	redirect '/items'
end

# route to show item details
get '/items/:id' do
	controller = ItemController.new
	controller.get_item_details(params)
end

# route to show edit item form
get '/items/:id/edit' do
	controller = ItemController.new
	controller.edit_item(params)
end

# route to update item after edit
post '/items/:id/submit_update' do
	controller = ItemController.new
	controller.update_item(params)
  redirect '/items'
end

# route to show delete item form
get '/items/:id/delete' do
	controller = ItemController.new
	controller.show_delete_item(params)
end

# route to delete item
post '/items/:id/submit_delete' do
	controller = ItemController.new
	controller.delete_item(params)
	redirect '/items'
end



# route to show all categories
get '/categories' do
	controller = CategoryController.new
	controller.show_all_categories()
end

# route to show create category form
get '/categories/create' do
	controller = CategoryController.new
	controller.new_category_form()
end
	
# route to create category
post '/categories/submit_create' do
	controller = CategoryController.new
	controller.create_new_category(params)
	redirect '/categories'
end

# route to show category details
get '/categories/:id' do
	controller = CategoryController.new
	controller.get_category_details(params)
end

# route to show edit category form
get '/categories/:id/edit' do
	controller = CategoryController.new
	controller.edit_category(params)
end

# route to update category after edit
post '/categories/:id/submit_update' do
	controller = CategoryController.new
	controller.update_category(params)
  redirect '/categories'
end

# route to show delete category form
get '/categories/:id/delete' do
	controller = CategoryController.new
	controller.show_delete_category(params)
end

# route to delete category
post '/categories/:id/submit_delete' do
	controller = CategoryController.new
	controller.delete_category(params)
	redirect '/categories'
end
