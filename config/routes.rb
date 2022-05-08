Rails.application.routes.draw do
  namespace :api do
      #baseapi
      get '/', to: 'baseapi#index'
      #library
      put '/library/:userid', to: 'library#update'
      get '/library/:userid', to: 'library#show'
      get '/library', to: 'library#index'
      post '/library', to: 'library#create'
      #account
      get '/account/:userid/:password', to: 'account#show'
      get '/account/:userid', to: 'account#show'
      get '/account', to: 'account#index'
      post '/account', to: 'account#create'
      #book
      get '/book/author/:author', to: 'book#show'
      get '/book/title/:title', to: 'book#show'
      get '/book/stack/:maxbookstoprocess', to: 'book#stack'
      get '/book/all/googlevolumeids', to: 'book#googlevolumeids'
      get '/book/:id', to: 'book#show'
      get '/book', to: 'book#index'
      post '/book', to: 'book#create'
      put '/book/:id', to: 'book#update'
  end
end