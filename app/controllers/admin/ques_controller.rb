class Admin::QuesController < ApplicationController

	def index
		@questions = Question.all
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
      redirect_to admin_ques_path
    else 
      render 'edit'
    end
  end

  def show
  end

	def create
		# binding.pry
    @question = Question.new(question_params)
    @ques = QuestionType.all
    if @question.save
      redirect_to admin_ques_path(@question)
    else
      render 'new'
     end
   end

	 private
    def question_params
      params.require(:question).permit(:description, :question_type_id)
    end
end

