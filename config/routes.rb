Rails.application.routes.draw do
  
  resources :questions do
    resources :answers
  end

  resources :answers
  

  root to: 'answers#new'
end
