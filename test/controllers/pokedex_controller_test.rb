require 'test_helper'

class MyPokedexControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get pokedex_show_url
    assert_response :success
  end

  test "should get new" do
    get pokedex_new_url
    assert_response :success
  end

  test "should get create" do
    get pokedex_create_url
    assert_response :success
  end

  test "should get edit" do
    get pokedex_edit_url
    assert_response :success
  end

  test "should get update" do
    get pokedex_update_url
    assert_response :success
  end

  test "should get destroy" do
    get pokedex_destroy_url
    assert_response :success
  end

end
