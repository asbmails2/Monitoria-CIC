MonitoriaCic::Application.routes.draw do
  resources :home
  root :to => redirect('/home')
<<<<<<< HEAD

  resources :candidatos
  root :to => redirect('/candidatos')

=======
>>>>>>> ef1dde9340b78b8e22bd4b6a8702931d6eb9b577
  resources :disciplinas do
  	collection { post :import }
  end
  root :to => redirect('/disciplinas')
<<<<<<< HEAD

=======
>>>>>>> ef1dde9340b78b8e22bd4b6a8702931d6eb9b577
  resources :professores do
  	collection { post :import }
  end
  root :to => redirect('/professores')
<<<<<<< HEAD
=======

>>>>>>> ef1dde9340b78b8e22bd4b6a8702931d6eb9b577
  
end