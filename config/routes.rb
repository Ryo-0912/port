Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: %i[new create index show] # 答えは一つしかないのであればresourceにしていいかな。
  end
  
  get 'genres/review/questions' => 'questions#review_index'
  resources :genres do
    resources :questions, only: %i[index new create]
  end
  resources :questions, only: %i[edit show update destroy]


  resources :password_resets, only: %i[new create edit update]
  root to: 'homes#top'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
