class DisciplinasController < ApplicationController
  def index
    @disciplinas = Disciplina.all
  end
  def new   
    @professores = Professor.all
    @disciplinas = Disciplina.new
  end
  def create
    @disciplina = Disciplina.create!(params.require(:disciplina).permit(:nome, :codigo, :professor))
    flash[:sucesso] = "#{@disciplina.nome} incluída com sucesso."
    redirect_to disciplinas_url
  end

  def import
    Disciplina.import(params[:file])
    redirect_to disciplinas_path, notice: "Disciplinas Adicionadas com Sucesso."
  end
end