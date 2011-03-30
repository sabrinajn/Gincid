require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  fixtures :items
  
  def test_should_require_name
    item = create(:name => nil)
    assert item.errors.invalid?(:name), ":name should be required"
    assert !item.valid?, "Item shouldn't be created"
  end

  def test_should_require_description
    item = create(:description => nil)
    assert item.errors.invalid?(:description), ":description should be required"
    assert !item.valid?, "Item shouldn't be created"
  end

  def test_should_require_item_type
    item = create(:item_type => nil)
    assert item.errors.invalid?(:item_type), ":item_type should be required"
    assert !item.valid?, "Item shouldn't be created"
  end

  def test_should_require_serial
    item = create(:serial => nil)
    assert item.errors.invalid?(:serial), ":serial should be required"
    assert !item.valid?, "Item shouldn't be created"
  end
  
  private
     def create(options={})
       Item.create({
         :name => "MACBOOK Sabrina",
         :description => "computador da usuária Sabrina",
         :serial => "XYX989488289423",
         :item_type => 1
         }.merge(options))
     end
end
