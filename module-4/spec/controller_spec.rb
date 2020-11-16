require './controllers/item_controller'
require './models/item'


describe ItemController do
  describe '#get_all_items' do
    it 'should show index page' do
      controller = ItemController.new

      response = controller.get_all_items
      
      /karena erb-nya di case ini ada binding sesuatu, maka expected_view harus dikasih tau tampilin result apa/
      expected_view = ERB.new(File.read("./views/index.erb")).result_with_hash(
        items: Item.get_all_items)
      expect(response).to eq(expected_view)
    end
  end

  describe '#create_new_item' do
    it 'should save item and render correct view' do
      controller = ItemController.new
      params = {
        name => 'Pisang Goreng',
        price = 5000,
        category_id = 3
      }

      expected_create = Item
  end
end

  