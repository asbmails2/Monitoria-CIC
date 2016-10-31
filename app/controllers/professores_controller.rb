class ProfessoresController < ApplicationController
  def index
    @professors = Professor.all
  end
  def new
  	@disciplinas = Disciplina.all  	
  	@professors = Professor.new
  end
  def create
  	@professors = Professor.create!(params.require(:professor).permit(:nome,:disciplina))
  	flash[:retorno] = "{professor.nome} adicionado com sucesso na disciplina {disciplina.nome}"
  	redirect_to disciplinas_url
  end
end