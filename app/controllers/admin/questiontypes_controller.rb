class Admin::QuestionTypesController < ApplicationController

    def index
        @questiontypes = QuestionType.all
    end

    def new
    end
    	
   def show
   end

   def create
end