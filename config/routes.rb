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
    get 'self_evaluation2', to: 'answers#self_evaluation2'
    get 'team_evaluation', to: 'answers#team_evaluation'
    get 'team_evaluation2', to: 'answers#team_evaluation2'
    post 'submit_for_self', to: 'answers#submit_for_self'
    post 'submit_for_team', to: 'answers#submit_for_team'
    get 'show', to: 'answers#show'
    get 'edit', to: 'answers#edit'
    
    put 'update_self_ans', to: 'answers#update_self_ans'
    get 'team_index', to: 'answers#team_index'
    get 'self_index', to: 'answers#self_index'
    put 'update_tem_ans', to: 'answers#update_tem_ans'
    get 'index_for_ans', to: 'answers#index_for_ans'
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


