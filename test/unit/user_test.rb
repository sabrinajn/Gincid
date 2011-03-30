require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users
  
  def test_should_require_name
    user = create(:name => nil)
    assert user.errors.invalid?(:name), ":name should be required"
    assert !user.valid?, "User shouldn't be created"
  end

  def test_should_require_phone
    user = create(:phone => nil)
    assert user.errors.invalid?(:phone), ":phone should be required"
    assert !user.valid?, "User shouldn't be created"
  end

  def test_should_require_user_type
    user = create(:user_type => nil)
    assert user.errors.invalid?(:user_type), ":user_type should be required"
    assert !user.valid?, "User shouldn't be created"
  end
  
  def test_should_deny_bad_email
    user = create(:email => 'bad@format')
    assert user.errors.invalid?(:email), ":email should be in a valid format"
    assert !user.valid?, "User shouldn't be created"
  end

  def test_should_deny_bad_phone
    user = create(:phone => '1111-1111')
    assert user.errors.invalid?(:phone), ":phone should be in a valid format"
    assert !user.valid?, "User shouldn't be created"
  end

  private
     def create(options={})
       User.create({
         :name => "sabrina neri",
         :email => "sabrinajn@gmail.com",
         :phone => "(11)9999-9999",
         :user_type => 1
         }.merge(options))
     end
end
