require 'test_helper'

class CitPublicationsControllerTest < ActionController::TestCase
  setup do
    @cit_publication = cit_publications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cit_publications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cit_publication" do
    assert_difference('CitPublication.count') do
      post :create, cit_publication: { all_author: @cit_publication.all_author, elib_id: @cit_publication.elib_id, main_author: @cit_publication.main_author, name: @cit_publication.name, periodical_name: @cit_publication.periodical_name, periodical_number: @cit_publication.periodical_number, source_id: @cit_publication.source_id }
    end

    assert_redirected_to cit_publication_path(assigns(:cit_publication))
  end

  test "should show cit_publication" do
    get :show, id: @cit_publication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cit_publication
    assert_response :success
  end

  test "should update cit_publication" do
    patch :update, id: @cit_publication, cit_publication: { all_author: @cit_publication.all_author, elib_id: @cit_publication.elib_id, main_author: @cit_publication.main_author, name: @cit_publication.name, periodical_name: @cit_publication.periodical_name, periodical_number: @cit_publication.periodical_number, source_id: @cit_publication.source_id }
    assert_redirected_to cit_publication_path(assigns(:cit_publication))
  end

  test "should destroy cit_publication" do
    assert_difference('CitPublication.count', -1) do
      delete :destroy, id: @cit_publication
    end

    assert_redirected_to cit_publications_path
  end
end
