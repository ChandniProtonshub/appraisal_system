class Admin::QuestionsController < ApplicationController

   before_action :authenticate_user!
   
    def new
        @users = User.all
    end

    def create
    end

    def edit
    end

    def update
    end

    def delete
    end
end