require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = users(:jane)
    @other_user = users(:eunice)
  end
  test "should get new" do
    get :new
    assert_response :success
  end
  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
   end
  test "should redirect update when not logged in" do
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  test "should redirect destroy when not logged in" do
     assert_no_difference 'User.count' do
     delete :destroy, id: @user
     # delete delete_user_path params:{id: @user}
     # delete user_url(@user)
  end
   assert_redirected_to login_url
end
end