Rails.application.routes.draw do
    # site_controller => SiteController
    # controller#action
    # controller => é uma classe.
    # action => é um método.
    # templete => Arquivo com o nome da action.
    get '/' =>  'site#home'
    get '/signup'  =>  'signup#new'
    post '/signup'  => 'signup#create'

    get '/login' => 'login#new'
end
