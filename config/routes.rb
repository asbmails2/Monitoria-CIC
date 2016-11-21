
MonitoriaCic::Application.routes.draw do
  resources :home
  root :to => redirect('/home')
  resources :disciplinas
  root :to => redirect('/disciplinas')
  resources :professores
  root :to => redirect('/professores')
end