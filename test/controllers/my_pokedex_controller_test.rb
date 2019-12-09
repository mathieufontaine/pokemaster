require 'test_helper'

class MyPokedexControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get my_pokedex_show_url
    assert_response :success
  end

  test "should get new" do
    get my_pokedex_new_url
    assert_response :success
  end

  test "should get create" do
    get my_pokedex_create_url
    assert_response :success
  end

  test "should get edit" do
    get my_pokedex_edit_url
    assert_response :success
  end

  test "should get update" do
    get my_pokedex_update_url
    assert_response :success
  end

  test "should get destroy" do
    get my_pokedex_destroy_url
    assert_response :success
  end

end
