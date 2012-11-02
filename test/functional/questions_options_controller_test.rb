require 'test_helper'

class QuestionsOptionsControllerTest < ActionController::TestCase
  setup do
    @questions_option = questions_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questions_option" do
    assert_difference('QuestionsOption.count') do
      post :create, questions_option: { label: @questions_option.label, question_id: @questions_option.question_id }
    end

    assert_redirected_to questions_option_path(assigns(:questions_option))
  end

  test "should show questions_option" do
    get :show, id: @questions_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questions_option
    assert_response :success
  end

  test "should update questions_option" do
    put :update, id: @questions_option, questions_option: { label: @questions_option.label, question_id: @questions_option.question_id }
    assert_redirected_to questions_option_path(assigns(:questions_option))
  end

  test "should destroy questions_option" do
    assert_difference('QuestionsOption.count', -1) do
      delete :destroy, id: @questions_option
    end

    assert_redirected_to questions_options_path
  end
end
