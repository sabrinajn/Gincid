require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Item.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    post :create, :item =>{:name => "Desktop1",:description => "computador", :serial => nil, :item_type => 1}
    assert_template 'new'
  end

  def test_create_valid
    assert_difference('Item.count') do
      post :create, :item =>{:name => "Desktop1",:description => "computador", :serial => "XYX989", :item_type => 1}
    end
    assert_redirected_to item_url(assigns(:item))
  end

  def test_edit
    get :edit, :id => Item.first
    assert_template 'edit'
  end

  def test_update_invalid
    put :update, :id => Item.first, :item => {:name => nil }
    assert_template 'edit'
  end

  def test_update_valid
    put :update, :id => Item.first, :item => {:name => "test" }
    assert_redirected_to item_url(assigns(:item))
  end

  def test_destroy
    item = Item.first
    delete :destroy, :id => item
    assert_redirected_to items_url
    assert !Item.exists?(item.id)
  end
end
