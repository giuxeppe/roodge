require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get registrations_new_url
    assert_response :success
  end

  test "should get create" do
    get registrations_create_url
    assert_response :success
  end

  test "should get edit" do
    get registrations_edit_url
    assert_response :success
  end

  test "should get update" do
    get registrations_update_url
    assert_response :success
  end
end
