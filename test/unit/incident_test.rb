require 'test_helper'

class IncidentTest < ActiveSupport::TestCase
  fixtures :users, :items, :incidents
  
  def test_should_require_description
    incident = create(:description => nil)
    assert incident.errors.invalid?(:description), ":description should be required"
    assert !incident.valid?, "Incident shouldn't be created"
  end

  def test_should_require_item
    incident = create(:item_id => nil)
    assert incident.errors.invalid?(:item_id), ":item_id should be required"
    assert !incident.valid?, "Incident shouldn't be created"
  end

  def test_should_deny_non_integer_item
    incident = create(:item_id => 'a')
    assert incident.errors.invalid?(:item_id), ":item_id should have had an error"
    assert !incident.valid?, "Incident shouldn't be created"
    
    incident = create(:item_id => 1.45)
    assert incident.errors.invalid?(:item_id), ":item_id should have had an error"
    assert !incident.valid?, "Incident shouldn't be created"
  end

  def test_should_require_creator
    incident = create(:user_id => nil)
    assert incident.errors.invalid?(:user_id), ":user_id should be required"
    assert !incident.valid?, "Incident shouldn't be created"
  end

  def test_should_deny_non_integer_creator
    incident = create(:user_id => 'a')
    assert incident.errors.invalid?(:user_id), ":user_id should have had an error"
    assert !incident.valid?, "Incident shouldn't be created"
    
    incident = create(:user_id => 1.45)
    assert incident.errors.invalid?(:user_id), ":user_id should have had an error"
    assert !incident.valid?, "Incident shouldn't be created"
  end
  
  def test_should_require_owner
    incident = create(:status => 2, :owner_id => nil)
    assert incident.errors.invalid?(:owner_id), ":owner_id should be required"
    assert !incident.valid?, "Incident shouldn't be created"
  end

  def test_should_deny_non_integer_owner
    incident = create(:status => 2, :owner_id => 'a')
    assert incident.errors.invalid?(:owner_id), ":owner_id should have had an error"
    assert !incident.valid?, "Incident shouldn't be created"
    
    incident = create(:status => 2, :owner_id => 1.2)
    assert incident.errors.invalid?(:owner_id), ":owner_id should have had an error"
    assert !incident.valid?, "Incident shouldn't be created"
  end

  def test_should_require_priority
    incident = create(:status => 2, :priority => nil)
    assert incident.errors.invalid?(:priority), ":priority should be required"
    assert !incident.valid?, "Incident shouldn't be created"
  end

  private
      def create(options={})
        Incident.create({
          :description => "Sistema down", 
          :user_id => 2,
          :owner_id => 2,
          :item_id => 2, 
          :priority => 1,
          :status => 1
        }.merge(options))
      end
end
