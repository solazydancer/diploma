require 'test_helper'

class SubPublicationsControllerTest < ActionController::TestCase
  setup do
    @sub_publication = sub_publications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_publications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_publication" do
    assert_difference('SubPublication.count') do
      post :create, sub_publication: { edu_org: @sub_publication.edu_org, number: @sub_publication.number, period_name: @sub_publication.period_name, pub_author: @sub_publication.pub_author, pub_cited: @sub_publication.pub_cited, pub_id: @sub_publication.pub_id, pub_name: @sub_publication.pub_name, pub_page: @sub_publication.pub_page, year: @sub_publication.year }
    end

    assert_redirected_to sub_publication_path(assigns(:sub_publication))
  end

  test "should show sub_publication" do
    get :show, id: @sub_publication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_publication
    assert_response :success
  end

  test "should update sub_publication" do
    patch :update, id: @sub_publication, sub_publication: { edu_org: @sub_publication.edu_org, number: @sub_publication.number, period_name: @sub_publication.period_name, pub_author: @sub_publication.pub_author, pub_cited: @sub_publication.pub_cited, pub_id: @sub_publication.pub_id, pub_name: @sub_publication.pub_name, pub_page: @sub_publication.pub_page, year: @sub_publication.year }
    assert_redirected_to sub_publication_path(assigns(:sub_publication))
  end

  test "should destroy sub_publication" do
    assert_difference('SubPublication.count', -1) do
      delete :destroy, id: @sub_publication
    end

    assert_redirected_to sub_publications_path
  end
end
