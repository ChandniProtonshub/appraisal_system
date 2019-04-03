class Users::AnswersController < ApplicationController

 #  def edit
 #   @answer = Answer.find_by_id(params[:id])
 # end

#  def update  
#    @answer = Answer.find_by_id(params[:id])
#    if @answer.update(answer_params)
#     redirect_to users_answers_path(@answer)
#   else
#     render 'edit'
#   end
# end

def update_ans
  params[:questions].each do |question|
    ques = Question.find question[0]
    ques.answers.update(user_id: current_user.id, description: question[1][:description])
  end
  redirect_to users_answers_path
end

def update_tem_ans
  params[:questions].each do |question|
    ques = Question.find question[0]
    ques.answers.update(user_id: current_user.id, description: question[1][:description])
    unless ques.answers.present?
      ques.answers.create(user_id: current_user.id, description: question[1][:description])
      ques.save 
    end
  end
  redirect_to users_team_index_path
end

def index
  @questions = QuestionType.find_by_name("self_question").questions
  @answer = Answer.new
end

def team_index
  @questions = QuestionType.find_by_name("team_question").questions
  @answer = Answer.new
end

def self_evaluation
  @questions = QuestionType.find_by_name("self_question").questions
  @answer = Answer.new
end

def self_evaluation2
  @questions = QuestionType.find_by_name("self_question2").questions
  @answer = Answer.new
end

def team_evaluation
  @questions = QuestionType.find_by_name("team_question").questions
  @answer = Answer.new
end


def team_evaluation2
  @questions = QuestionType.find_by_name("team_question2").questions
  @answer = Answer.new
end

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
