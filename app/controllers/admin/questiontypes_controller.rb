class Admin::QuestionTypesController < ApplicationController
	
    before_action :authenticate_user!
    before_action :authenticate_admin

    def index
        @questiontypes = QuestionType.all
    end

    def new
    end
    	
    def show
    end

    def create
    end

    private

    def authenticate_admin
      unless current_user.is_admin?
        redirect_to welcome_index_path
    end
  end