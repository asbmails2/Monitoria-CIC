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
    nome = params[:nome]
    codigo = Oferta.where(:nome => nome).first.codigo
    @disciplina = params.require(:disciplina).permit(:nome, :professor, :vagas)
    @disciplina.codigo = codigo
    prof = params.require(:disciplina).permit(:professor).values

    if Disciplina.exists?(:codigo => @disciplina.codigo, :professor => prof )
      flash[:aviso] = "A oferta para a disciplina #{@disciplina.codigo} não foi criada pois já existe"
    else
      if Disciplina.create!(@disciplina)
        flash[:sucesso] = "A oferta de monitoria para #{@disciplina.codigo} foi criada com sucesso!"
      else
        flash[:aviso] = "Erro ao criar oferta de monitoria para #{@disciplina.codigo}."
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
    @check = Disciplina.where( :codigo => @disciplina.codigo, :professor => @prof[0]).ids

    if  @check.empty? or (@check.include? @disciplina.id) #Verifica se eh a mesma disciplina que ja existe
      if @disciplina.update_attributes!(params[:disciplina])
        flash[:sucesso] = "#{@disciplina.nome} do professor #{@disciplina.professor} foi editado com sucesso!"
      else
        flash[:aviso] = "Erro ao editar #{@disciplina.nome} do professor #{@disciplina.professor}"
      end
    else
      flash[:aviso] = "A oferta para a disciplina #{@check} não foi criada pois já existe"
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
