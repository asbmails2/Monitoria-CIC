class HomeController < ApplicationController
skip_before_action :authenticate_user!#, :only => [:index]
end
# Controller responsável pela página inicial
# TODO: diferentes inicializações dependendo do login aluno/professor
