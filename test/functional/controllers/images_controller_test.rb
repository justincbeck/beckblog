require File.dirname(__FILE__) + '/../functional_test_helper'
require 'images_controller'

class ImagesControllerTest < ActionController::TestCase
  def test_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:images)
  end

  def test_get_new
    get :new
    assert_response :success
  end

  #def test_create_image
  #  assert_difference('Image.count') do
  #    post :create, :headers => { [Content-Type] => 'multipart/form-data' } , :image => { :name => "test", :file => StringIO.new('Photo_89.jpg') }
  #  end
  #
  #  assert_redirected_to image_path(assigns(:image))
  #end

  #test "should show image" do
  #  get :show, :id => images(:one).to_param
  #  assert_response :success
  #end

  #test "should get edit" do
  #  get :edit, :id => images(:one).to_param
  #  assert_response :success
  #end

  #test "should update image" do
  #  put :update, :id => images(:one).to_param, :image => { }
  #  assert_redirected_to image_path(assigns(:image))
  #end

  #test "should destroy image" do
  #  assert_difference('Image.count', -1) do
  #    delete :destroy, :id => images(:one).to_param
  #  end
  #
  #  assert_redirected_to '/images'
  #end
end
