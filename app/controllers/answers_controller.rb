class AnswersController < ApplicationController
   def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to question_path(@question)
    end
   end
 
  private
    def answer_params
      params.require(:answer).permit(:body, :correct)
    end
end
