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
end
