require 'test_helper'

class IncidentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Incident.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    post :create, :incident =>{:description => nil, :user_id => 2, :owner_id => 2, :item_id => 2, :priority => 1, :status => 1}
    assert_template 'new'
  end

  def test_create_valid
    assert_difference('Incident.count') do
      post :create, :incident =>{:description => "Sistema down", :user_id => 2, :owner_id => 2, :item_id => 2, :priority => 1, :status => 1}
    end
    assert_redirected_to incident_url(assigns(:incident))
  end

  def test_edit
    get :edit, :id => Incident.first
    assert_template 'edit'
  end

  def test_update_invalid
    put :update, :id => Incident.first, :item => {:description => nil }
    assert_template 'edit'
  end

  def test_update_valid
    put :update, :id => Incident.first, :item => {:description => "test" }
    assert_redirected_to incident_url(assigns(:incident))
  end

  def test_destroy
    incident = Incident.first
    delete :destroy, :id => incident
    assert_redirected_to incidents_url
    assert !Incident.exists?(incident.id)
  end
end
