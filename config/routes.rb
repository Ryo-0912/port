Rails.application.routes.draw do
  resources :notifications, only: %i[create index destroy]

  get '/sitemap', to: redirect("https://s3-ap-northeast-1.amazonaws.com/#{ENV['Rails.application.credentials.aws[:s3_bucket_name]']}/sitemaps/sitemap.xml.gz")

  resources :inquiries
  namespace :admin do
    resources :users
  end


  resources :questions do
    resources :answers, only: %i[new create show]
  end

  resources :answers, only: %i[edit update]
  post 'answers/:id' => 'answers#updating'

  resources :exams

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

  get 'terms', to: 'terms#index'
  get 'privacy', to: 'privacies#index'

  resources :users, only: %i[new create index show]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
