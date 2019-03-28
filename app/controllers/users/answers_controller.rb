class Users::AnswersController < ApplicationController
     
  def index
    @answers = Answer.all
  end
 
  # def show
  #   @answer = Answer.find_by_id(params[:id])
  #   redirect_to answers_path  if @answer.nil?
  # end
 
  def new
    @answer = Answer.new
  end
 
  def edit
    @answer = Answer.find(params[:id])
  end
 
  def create
    @answer = Answer.new(answer_params)
 
    if @answer.save
      redirect_to users_answer(@answer)
    else
      render 'new'
    end
  end
 
  def update
    @answer = Answer.find(params[:id])
     if @answer.update(answer_params)
      redirect_to @answer
    else
      render 'edit'
    end
  end
 
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
 
    redirect_to answers_path
  end

  def self_evaluation
   @questions = Question.all
   @answer = Answer.new
  end

  def team_evaluation
    @questions = Question.all
  end

  def submit
     @questions = Question.all
    binding.pry
    # @question = Question.find_by_id(params[:question_id])
   
    # @answer = @question.answers.create(answer_params)
    # redirect_to users_submit_path(@question)
  end

 private
    def answer_params
      params.require(:answer).permit(:description, :user_id, :question_id)
    end
end