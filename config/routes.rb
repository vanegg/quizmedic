Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 's_pages#home'
  get '/home', to: 's_pages#home'
  get '/game', to: 's_pages#game'
  get '/another_question', to: 's_pages#another_question'
  post '/question', to: 's_pages#question'
  get '/winner', to: 's_pages#winner'
end
