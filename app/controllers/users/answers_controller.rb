class Users::AnswersController < ApplicationController

before_action :authenticate_user!

def index_for_ans
  @user = User.where(:id => params["user_id"]).first
  @self_questions = QuestionType.find_by_name("self_question").questions
  @team_questions = QuestionType.find_by_name("team_question").questions
  @answer = Answer.new
end

def update_self_ans
  params[:questions].each do |question|
    ques = Question.find question[0]
    ques.answers.update(user_id: current_user.id, description: question[1][:description])
    unless ques.answers.present?
      ques.answers.create(user_id: current_user.id, description: question[1][:description])
      ques.save 

    end
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

def self_index
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

# def submit_for_tem
#   params[:questions].each do |question|
#     ques = Question.find question[0]
#     ques.answers.create(user_id: current_user.id, description: question[1][:description])
#     ques.save      
#   end
#   redirect_to users_team_index_path
# end

def submit_for_team
  params[:questions].each do |question|
    ques = Question.find question[0]
  if ques.answers.present?
     ques.answers.update(user_id: current_user.id, description: question[1][:description])
    flash[:success] = "Answers Update Successfully"
  else
    ques.answers.create(user_id: current_user.id, description: question[1][:description])
    ques.save  
    flash[:success] = "Answer submitted Successfully"
 end
end
redirect_to users_team_index_path
end


def submit_for_self
  params[:questions].each do |question|
    ques = Question.find question[0]
  if ques.answers.present?
     ques.answers.update(user_id: current_user.id, description: question[1][:description])
    flash[:success] = "Answers Update Successfully"
  else

    ques.answers.create(user_id: current_user.id, description: question[1][:description])
    ques.save 
    flash[:success] = "Answer Created Successfully" 
 end
end
redirect_to users_self_index_path
end

# def submit_for_self

#   params[:questions].each do |question|
#     ques = Question.find question[0]
#     ques.answers.create(user_id: current_user.id, description: question[1][:description])
#     ques.save      
#   end
#   redirect_to users_self_index_path
# end

# private

# def answer_params
#   params.require(:answer).permit(:description)  
# end
end
