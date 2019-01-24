require 'test_helper'

class SourcePeopleControllerTest < ActionController::TestCase
  setup do
    @source_person = source_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:source_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create source_person" do
    assert_difference('SourcePerson.count') do
      post :create, source_person: { first_name: @source_person.first_name, last_name: @source_person.last_name, mephi_id: @source_person.mephi_id, second_name: @source_person.second_name }
    end

    assert_redirected_to source_person_path(assigns(:source_person))
  end

  test "should show source_person" do
    get :show, id: @source_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @source_person
    assert_response :success
  end

  test "should update source_person" do
    patch :update, id: @source_person, source_person: { first_name: @source_person.first_name, last_name: @source_person.last_name, mephi_id: @source_person.mephi_id, second_name: @source_person.second_name }
    assert_redirected_to source_person_path(assigns(:source_person))
  end

  test "should destroy source_person" do
    assert_difference('SourcePerson.count', -1) do
      delete :destroy, id: @source_person
    end

    assert_redirected_to source_people_path
  end
end
