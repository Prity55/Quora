Rails.application.routes.draw do
  
  get 'welcomes/index'
  devise_for :users, :controllers => {:registrations => "users/registrations"}, action: :edit
  resources :topics do
  	member do
  	  get :join
 	  end
      get :all, on: :collection
  end
  resources :employments ,except:[:index] 
  resources :educations ,except:[:index] 
  resources :questions do
    get :view, on: :collection
    resources :answers
  end
  resources :images,only:[:new,:create,:destroy]
  get '/users',to:'devise/registrations#new'
  get '/employments',to:'employments#new'
  get '/educations',to:'educations#new'
  get '/employments/:id',to: 'employments#edit'
  
  resources :answers,except:[:new] do
      member do
      get :views
    end
  end
   resources :upvotes,only:[:new,:create,:destroy]
   resources :downvotes,only:[:new,:create,:destroy]
   resources :follows,only:[:new,:create,:destroy]
  root 'questions#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
