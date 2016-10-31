
MonitoriaCic::Application.routes.draw do
  resources :disciplinas
  root :to => redirect('/disciplinas')
  resources :professores
  root :to => redirect('/professores')
end