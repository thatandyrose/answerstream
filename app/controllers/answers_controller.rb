class AnswersController < ApplicationController
  before_filter :get_question

  def index
    @answers = Answer.all
  end
  
  def new
    if params[:question_id].nil?
      redirect_to new_question_answer_path(Question.first)
    else
      @answer = @question.answers.new
    end
  end

  def create
    @answer = @question.answers.new params.require(:answer).permit(:text, :name)

    if @answer.save
      redirect_to question_answers_path(@question)
    else
      render :new
    end
  end

  def get_question  
    @question = Question.find params[:question_id] if params[:question_id]
  end
end
