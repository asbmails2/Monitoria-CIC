
MonitoriaCic::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :rails_admin
  root :to => redirect('/admin')

  devise_for :users
  resources :home
  root :to => redirect('/home')
  resources :candidatos
  root :to => redirect('/candidatos')
  resources :disciplinas
  root :to => redirect('/disciplinas')
  resources :professores do
    collection { post :import }
  end
  root :to => redirect('/professores')
  resources :lista_disciplinas do
    collection { post :import }
  end
  root :to => redirect('/lista_disciplinas')

  root to: "home#index"
end
