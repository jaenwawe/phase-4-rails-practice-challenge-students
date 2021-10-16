Rails.application.routes.draw do

  get 'instructors/', to: 'instructors#index'
  post 'instructors/', to: 'instructors#create'
  patch 'instructors/:id', to: 'instructors#update'
  delete 'instructors/:id', to: 'instructors#destroy'
end
