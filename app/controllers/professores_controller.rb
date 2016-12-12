class ProfessoresController < ApplicationController
  def index
    @professors = Professor.all
  end
  def new     
    @professors = Professor.new
  end
  def create
    print params[:nome]
    @professor = params.require(:professor).permit(:nome, :email, :sala)
    @parray = params.require(:professor).permit(:nome, :email).values

    if Professor.exists?(:nome => @parray[0], :email => @parray[1])
      flash[:aviso] = "O professor #{@parray[0]} não foi incluído pois já existe."
    else  
      @professorCadastrado = Professor.create!(@professor)
      flash[:sucesso] = "#{@professorCadastrado.nome} incluído com sucesso."
    end
    redirect_to professores_url
  end
  def edit
    @id = params[:id]
    @professor = Professor.find(@id)
  end
  def update
    params.permit!
    @id = params[:id]
    @professor = Professor.find(@id)
    @parray = params.require(:professor).permit(:nome, :email).values
    
    if Professor.exists?(:nome => @parray[0], :email => @parray[1])
      flash[:aviso] = "O professor #{@parray[0]} não foi modificado pois já existe."
    else  
      if @professor.update_attributes!(params[:professor])
        flash[:sucesso] = "#{@professor.nome} foi editado com sucesso."
      else
        flash[:aviso] = "Erro ao editar #{@professor.nome}."
      end
    end
  end

  def import
    Professor.import(params[:file])
    redirect_to professores_path, notice: "Professores Adicionados com Sucesso."
  end

  def destroy
    @id = params[:id]
    @professor = Professor.find(@id).destroy
    flash[:sucesso] = "Professor #{@professor.nome} removido com sucesso."
    redirect_to professores_url
  end
  def show
    @id = params[:id]
    @professor = Professor.find(@id)
  end
end