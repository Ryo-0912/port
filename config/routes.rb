Rails.application.routes.draw do
  resources :genres do
    resources :questions
  end
  resources :password_resets, only: %i[new create edit update]
  root to: 'homes#top'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :genres
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
