Rails.application.routes.draw do
  # site_controller => SiteController
  # controller#action
  # controller => é uma classe.
  # action => é um método.
  # templete => Arquivo com o nome da action.
  root to: 'site#home'

  get '/signup' =>  'signup#new', as: 'signup'
  post '/signup'  => 'signup#create'

  get '/login' => 'login#new', as: 'login'
  post '/login' => 'login#create'
  delete 'logout' => 'login#destroy', as: 'logout'

  get '/tasks' => 'tasks#index', as: 'tasks'
  post '/tasks/new' => 'tasks#create', as: 'new_task'
  get '/tasks/:id/edit' => 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id/edit' => 'tasks#update'
  get '/tasks/:id/remove' => 'tasks#remove', as: 'remove_task'
  delete '/tasks/:id/remove' => 'tasks#destroy'
end
