require 'test_helper'

class PasswordControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user2 = User.create(name: 'ana', email: 'ana@gmail.com', password: '123123')
  end

  test 'it updates the password' do
    put v1_user_password_path(@user2.id, id: 1), params: { password: '321321' }, headers: { 'auth-token': @user2.token}
    assert_response(:success)
  end

  test 'cant access without token permission' do
    put v1_user_password_path(@user2.id, id: 1), params: { password: '321321' }, headers: { 'auth-token': @user2.token.reverse }
    json_response = JSON.parse(response.body)
    assert_equal 'Invalid token', json_response['token']
  end
end
