module QuestionsAnswers
  extend ActiveSupport::Concern

  included do
    def load_question_answers
      @question = @question.decorate
      @answer ||= @question.answers.build
      @answers = @question.answers.order(created_at: :desc).page params[:page]
      @answers = @answers.decorate

      # Answer.where(question: @question).limit(2).order(created_at: :desc)
    end
  end
end
