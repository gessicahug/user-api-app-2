require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.create(name: 'gessica', email: 'gessica@gmail.com', password: '123123')
  end

  test 'name should not be empty' do
    @user = User.new(name: '', email: 'gessica@gmail.com', password: '123123')
    assert_not(@user.valid?, 'User was saved with a blank name')
  end

  test 'email should not be empty' do
    @user = User.new(name: 'gessica', email: '', password: '123123')
    assert_not(@user.valid?, 'User was saved with a blank email')
  end

  test 'password should not be empty' do
    @user = User.new(name: 'gessica', email: 'gessica@gmail.com', password: '')
    assert_not(@user.valid?, 'User was saved with a blank password')
  end

  test 'email should be unique' do
    @user = User.create(name: 'gessica', email: 'gessica@gmail.com')
    @user2  = User.new(name: 'louise', email: 'gessica@gmail.com')
    assert_not(@user2.valid?, 'the email must be unique')
  end

  test 'email should match email standard pattern' do
    @user = User.new(name: 'Gessica', email: 'g.gmail.com')
    assert_not(@user.valid?)
  end

  test 'user has secure password' do
    assert_respond_to @user, :password_digest
    assert_respond_to @user, :authenticate, 'User requires has_secure_password'
  end

  test 'user has secure token' do
    assert_respond_to @user, :token
  end
end
