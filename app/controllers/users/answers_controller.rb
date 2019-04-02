class Users::AnswersController < ApplicationController

  def edit
   @answer = Answer.find_by_id(params[:id])
 end

 def update  
   @answer = Answer.find_by_id(params[:id])
   if @answer.update(answer_params)
    redirect_to users_answers_path(@answer)
  else
    render 'edit'
  end
end

def index
  @questions = QuestionType.find_by_name("self_question").questions
  # binding.pry
  @answer = Answer.new
end

def self_evaluation
  @questions = QuestionType.find_by_name("self_question").questions
  @answer = Answer.new
end

def team_evaluation
  @questions = QuestionType.find_by_name("team_question").questions
    # @questions = Question.all
    @answer = Answer.new
  end

#   def submit2
#     params[:questions].each do |question|
#       ques = Question.find question[0]
#       ques.answers.create(user_id: current_user.id, description: question[1][:description])
#       ques.save      
#     end
#     redirect_to  users_show_path
#   end
# end

def submit
  params[:questions].each do |question|
    ques = Question.find question[0]
    ques.answers.create(user_id: current_user.id, description: question[1][:description])
    ques.save      
  end
  redirect_to users_answers_path
end

private

def answer_params
  params.require(:answer).permit(:description)  
end
end