require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #   @question = questions(:one)
  #   @answer = answers(:one)
  # end

  # # test "should get index" do
  # #   get "/questions"
  # #   assert_response :success
  # # end

  # # test "should get new" do
  # #   get new_answer_url
  # #   assert_response :success
  # # end

  # # test "should create answer" do
  # #   assert_difference('Answer.count') do
  # #     post answers_url, params: { answer: { body: @answer.body, question_id: @answer.question_id } }
  # #   end

  # #   assert_redirected_to answer_url(Answer.last)
  # # end

  # # test "should show answer" do
  # #   get answer_url(@answer)
  # #   assert_response :success
  # # end

  # # test "should get edit" do
  # #   get edit_answer_url(@answer)
  # #   assert_response :success
  # # end

  # # test "should update answer" do
  # #   patch answer_url(@answer), params: { answer: { body: @answer.body, question_id: @answer.question_id } }
  # #   assert_redirected_to question_path(@question)
  # #   print Faker::Lorem.word
  # # end

  # # test "should destroy answer" do
  # #   assert_difference('Answer.count', -1) do
  # #     #answer = question.answers.find_by
  # #   @answer.delete
  # #   end

  # #   assert_redirected_to question_path(question)
  # # end

  #  private

  # def answer_create_params
  #   params.require(:answer).permit(:body).merge(user: current_user)  # с помощью .merge добавляем в параметры еще и id пользователя
  # end

  # def answer_update_params
  #   params.require(:answer).permit(:body)
  # end

  # def set_question!
  #   @question = Question.find params[:question_id]
  # end

  # def set_answer!
  #   @answer = @question.answers.find params[:id]
  # end
end
