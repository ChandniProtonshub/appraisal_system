class Admin::QuesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
  @user = User.where(:id => params["user_id"]).first
  @self_questions = QuestionType.find_by_name("self_question").questions
  @team_questions = QuestionType.find_by_name("team_question").questions
  @answer = Answer.new
  end

  def new
    @ques = QuestionType.all
    @question = Question.new    
	end

  def edit
     @ques = QuestionType.all
    @question = Question.find(params[:id])
  end

  def update
   @question = Question.find(params[:id])
     if @question.update(question_params)
      redirect_to admin_ques_path, success: "Question Update Successfully"
    else 
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:success] = "Question deleted Successfully"
    redirect_to admin_ques_path
  end

	def create
	 @question = Question.new(question_params)
    @ques = QuestionType.all
    if @question.save
            redirect_to admin_ques_path(@question)
            flash[:success] = "Question Created Successfully"
    else
      
      render 'new'
     end
   end

	 private
    def question_params
      params.require(:question).permit(:description, :question_type_id)
    end

    def authenticate_admin
      unless current_user.is_admin?
        redirect_to welcome_index_path
      end
    end
end




   

