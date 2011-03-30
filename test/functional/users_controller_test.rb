require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => User.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    post :create, :user =>{:name=>"pedro", :email => "pedro@com", :phone=>"(11)1111-1111", :user_type => 2}
    assert_template 'new'
  end

  def test_create_valid
    assert_difference('User.count') do
      post :create, :user => {:name => "sabrina neri", :email => "sabrinajn@gmail.com", :phone => "(11)9999-9999", :user_type => 1}  
    end
    assert_redirected_to user_path(assigns(:user))
  end

  def test_edit
    get :edit, :id => User.first
    assert_template 'edit'
  end

  def test_update_invalid
    put :update, :id => User.first, :user => {:email => "email@com" }
    assert_template 'edit'
  end

  def test_update_valid
    put :update, :id => User.first, :user => {:email => "email@email.com" }
    assert_redirected_to user_url(assigns(:user))
  end

  def test_destroy
    user = User.first
    delete :destroy, :id => user
    assert_redirected_to users_url
    assert !User.exists?(user.id)
  end
end
