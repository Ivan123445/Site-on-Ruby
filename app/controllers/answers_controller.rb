# frozen_string_literal: true

# answers controller
class AnswersController < ApplicationController
  include QuestionsAnswers
  before_action :set_question!
  before_action :set_answer!, except: :create

  def update
    if @answer.update answer_update_params
      flash[:success] = t '.success'
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def edit; end

  def create
    @answer = @question.answers.build answer_create_params

    if @answer.save
      flash[:success] = t '.success'
      redirect_to question_path(@question)
    else
      @answers = @question.answers.order created_at: :desc
      render 'questions/show'
    end
  end

  def destroy
    @answer.destroy
    flash[:success] = t '.success'
    redirect_to question_path(@question)
  end

  private

  def answer_create_params
    # с помощью .merge добавляем в параметры id пользователя
    params.require(:answer).permit(:body).merge(user: current_user)
  end

  def answer_update_params
    params.require(:answer).permit(:body)
  end

  def set_question!
    @question = Question.find params[:question_id]
  end

  def set_answer!
    @answer = @question.answers.find params[:id]
  end
end
