class ListaDisciplinasController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    @lista_disciplinas = ListaDisciplina.all
  end
  def new
    @professores = Professor.all
    @lista_disciplinas = ListaDisciplina.new
  end
  def create
    @lista_disciplinas = ListaDisciplina.create!(params.require(:lista_disciplinas).permit(:nome, :codigo))
    flash[:sucesso] = "#{@lista_disciplinas.nome} incluída com sucesso."
    redirect_to lista_disciplinas_url
  end

  def import
    ListaDisciplina.import(params[:file])
    redirect_to lista_disciplinas_path, notice: "Disciplinas Adicionadas com Sucesso."
  end
end
