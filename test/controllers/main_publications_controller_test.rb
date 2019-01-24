require 'test_helper'

class MainPublicationsControllerTest < ActionController::TestCase
  setup do
    @main_publication = main_publications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:main_publications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create main_publication" do
    assert_difference('MainPublication.count') do
      post :create, main_publication: { author_elib_id: @main_publication.author_elib_id, edu_org: @main_publication.edu_org, elib_id: @main_publication.elib_id, imp_f: @main_publication.imp_f, main_author: @main_publication.main_author, name: @main_publication.name, norm_cit: @main_publication.norm_cit, norm_cit_dir: @main_publication.norm_cit_dir, nuc_rinz_cited: @main_publication.nuc_rinz_cited, period: @main_publication.period, rinz_cited: @main_publication.rinz_cited, scopus_cited: @main_publication.scopus_cited, wos_cited: @main_publication.wos_cited, year: @main_publication.year }
    end

    assert_redirected_to main_publication_path(assigns(:main_publication))
  end

  test "should show main_publication" do
    get :show, id: @main_publication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @main_publication
    assert_response :success
  end

  test "should update main_publication" do
    patch :update, id: @main_publication, main_publication: { author_elib_id: @main_publication.author_elib_id, edu_org: @main_publication.edu_org, elib_id: @main_publication.elib_id, imp_f: @main_publication.imp_f, main_author: @main_publication.main_author, name: @main_publication.name, norm_cit: @main_publication.norm_cit, norm_cit_dir: @main_publication.norm_cit_dir, nuc_rinz_cited: @main_publication.nuc_rinz_cited, period: @main_publication.period, rinz_cited: @main_publication.rinz_cited, scopus_cited: @main_publication.scopus_cited, wos_cited: @main_publication.wos_cited, year: @main_publication.year }
    assert_redirected_to main_publication_path(assigns(:main_publication))
  end

  test "should destroy main_publication" do
    assert_difference('MainPublication.count', -1) do
      delete :destroy, id: @main_publication
    end

    assert_redirected_to main_publications_path
  end
end
