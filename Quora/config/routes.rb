Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'welcomes/index'
  devise_for :users, :controllers => {:registrations => "users/registrations"}, action: :edit
  resources :users, only: [:index,:destroy] do
    member do
      get :bookmarks
    end
  end
  resources :topics do
  	member do
  	  get :join
      get :unjoin
 	  end
    get :all, on: :collection
  end
  resources :employments ,except:[:index] 
  resources :educations ,except:[:index] 
  resources :questions do
    get :view, on: :collection
    member do
      get :follow
      get :bookmark
    end
    resources :answers
  end
  resources :images,only:[:new,:create,:destroy]
  get '/users',to:'devise/registrations#new'
  get '/employments',to:'employments#new'
  get '/educations',to:'educations#new'
  get '/employments/:id',to: 'employments#edit'
  resources :answers do
    member do
      get :views
      get :upvote 
      get :downvote
    end
  end
   resources :upvotes,only:[:new,:create,:destroy]
   resources :downvotes,only:[:new,:create,:destroy]
   resources :follows,only:[:new,:create,:destroy]
   root 'questions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
