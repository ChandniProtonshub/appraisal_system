class Users::AnswersController < ApplicationController

  def edit
    @question = Question.find_by_id(params[:question_id])
    @answer = @question.answers.find_by_id(params[:id])
  end

  def update
    @question = Question.find_by_id(params[:question_id])
    @answer = @question.answers.find_by_id(params[:id])
    if @answer.update(answer_params)
      redirect_to users_show_path(@answer)
    else
      render 'edit'
    end
  end


  def show
    # binding.pry
    @questions = Question.all
  end

  def self_evaluation
    @questions = Question.all
    @answer = Answer.new
  end

  def team_evaluation
    @questions = Question.all
  end

  def submit
    params[:questions].each do |question|
      ques = Question.find question[0]
      ques.answers.create(user_id: current_user.id, description: question[1][:description])
      ques.save      
    end
    redirect_to  users_show_path
  end

  private
  
  def answer_params
    params.require(:answer).permit(:description, :question_id)  
  end
end