Rails.application.routes.draw do
  resources :genres, only: %i[index] 
  resources :password_resets, only: %i[new create edit update]
  root to: 'home#top'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
