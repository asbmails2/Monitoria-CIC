MonitoriaCic::Application.routes.draw do
  resources :home
  root :to => redirect('/home')
  resources :disciplinas do
  	collection { post :import }
  end
  root :to => redirect('/disciplinas')
  resources :professores do
  	collection { post :import }
  end
  root :to => redirect('/professores')

  
end