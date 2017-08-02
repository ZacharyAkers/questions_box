class QuestionsController < ApplicationController
    before_action :question_find, only: [:show, :destroy, :edit]
    before_action :authorize, except: [:show, :index]
    def index
    @questions = Question.all.page params[:page]
    end

    def new
        @question = Question.new
    end

    def create
        @question = Question.new(questions_params)
        @question.user_id = current_user.id
        if @question.save
            redirect_to questions_path(@question)
        else
            redirect_to new_question_path
        end
    end

    def edit
        @question
    end

    def show
        @question
    end

    def destroy
        @question = Question.delete
    end
  private 
  def questions_params
    params.require(:question).permit(:title, :body)
  end

  def question_find
    @question = Question.find(params[:id])
  end
end
