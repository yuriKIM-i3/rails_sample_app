require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    #로그인 에러메세지가 다른 화면에서 안보이는지 테스트
    get login_path
    assert_template 'session/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_response :unprocessable_entity
    assert_template 'session/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end