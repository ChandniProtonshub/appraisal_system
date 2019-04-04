class Admin::QuestionTypesController < ApplicationController
	
    before_action :authenticate_user!

    def index
        @questiontypes = QuestionType.all
    end

    def new
    end
    	
   def show
   end

   def create
end