require 'sinatra'
require './db_connector'


#INDEX / MAIN PAGE
get '/' do
    items = get_all_items
    erb :index, locals: {
        things: items
    }
end


#CREATE
get '/items/create' do
  categories = get_all_categories()
  erb :create, locals: {
    kategoris: categories
  }
end

post '/items/submit-create' do
  name = params['item_name']
  price = params['price']
  category_id = params['category']
  create_new_item(name, price, category_id)
  redirect '/'
end


#READ / SHOW
get '/items/:id' do
  item_id = params['id']
  item_details = get_item_details(item_id)
  erb :read_show, locals: {
    details: item_details
  }
end


#UPDATE / EDIT
get '/items/:id/edit' do
  item_id = params['id']
  items = get_item_details(item_id)
  categories = get_all_categories()
  erb :update_edit, locals: {
    things: items,
    kategoris: categories
  }
end

post '/items/:id/submit-update' do
  name = params['item_name']
  price = params['price']
  category_id = params['category']
  item_id = params['id']
  update_item(name, price, category_id, item_id)
  redirect '/'
end


#DELETE
get '/items/:id/delete' do
  item_id = params['id']
  items = get_item_details(item_id)
  erb :delete, locals: {
    things: items
  }
end

post '/items/:id/submit-delete' do
  item_id = params['id']
  delete_item(item_id)
  redirect '/'
end
