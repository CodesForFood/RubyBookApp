Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/search_books', to: 'home#search_books'
  get '/view_all', to: "home#index"
end
