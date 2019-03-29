Rails.application.routes.draw do
  # devise_for :users

  get 'welcome/index'
  root 'welcome#index'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  resource :users, only: [:show, :edit, :update]

  namespace :admin do
    resources :questions
    resources :ques
  end

  # namespace :admin do
  #   resources :questiontypes
  # end

  namespace :users do
    resources :answers do
      # get 'self_evaluation'
      # get 'team_evaluation'
  end
     get 'self_evaluation', to: 'answers#self_evaluation'
      get 'team_evaluation', to: 'answers#team_evaluation'
      post 'submit', to: 'answers#submit'
      post 'submit2',  to:'answers#submit2'
end

   namespace :admin do
    resources :users do
      get 'assign_questions'
    end
    
    root to: "users#index"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# Cc8989647346$

  
