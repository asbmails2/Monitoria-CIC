class DisciplinasController < ApplicationController
  def index
    @disciplinas = Disciplina.all
  end
  def new
    @professores = Professor.all
    @ofertadas = Oferta.all #todas as disciplinas ofertadas no semestre
    @disciplinas = Disciplina.new
  end
  def create
    params.permit!
    @disciplina = params.require(:disciplina).permit(:nome, :professor, :vagas)
    arr = params.require(:disciplina).permit(:nome, :professor).values

    if Disciplina.exists?(:nome => arr[0], :professor => arr[1])
      flash[:aviso] = "A oferta não foi incluída pois já existe"
    else
      if Disciplina.create!(@disciplina)
        flash[:sucesso] = "Disciplina incluída com sucesso."
      else
        flash[:aviso] = "Ocorreu um erro!"
      end
    end
    redirect_to disciplinas_url
  end
    def edit
    @id = params[:id]
    @disciplina = Disciplina.find(@id)
    @professores = Professor.all
  end
  def update
    params.permit!
    @id = params[:id]
    @disciplina = Disciplina.find(@id)
    @prof = params.require(:disciplina).permit(:professor).values
    @check = Disciplina.where( :nome => @disciplina.nome, :professor => @prof[0]).ids

    if  @check.empty? or (@check.include? @disciplina.id) #Verifica se eh a mesma disciplina que ja existe
      if @disciplina.update_attributes!(params[:disciplina])
        flash[:sucesso] = "Disciplina foi editada com sucesso."
      else
        flash[:aviso] = "Erro ao editar #{@disciplina.nome} do professor #{@disciplina.professor}"
      end
    else
      flash[:aviso] = "A oferta não foi criada pois já existe"
    end
    redirect_to disciplinas_url
  end
  def destroy
    @id = params[:id]
    @disciplina = Disciplina.find(@id).destroy
    flash[:sucesso] = "Disciplina removida com sucesso"
    redirect_to disciplinas_url
  end
  def show
    @id = params[:id]
    @disciplina = Disciplina.find(@id)
  end
end
