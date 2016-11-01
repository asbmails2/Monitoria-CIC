class ProfessoresController < ApplicationController
  def index
    @professors = Professor.all
  end
  def new  	 	
  	@professors = Professor.new
  end
  def create
  	@professor = Professor.create!(params.require(:professor).permit(:nome, :email, :sala))
  	flash[:retorno] = "#{@professor.nome} incluído com sucesso."
  	redirect_to professores_url
  end
  def edit
  	@id = params[:id]
  	@professor = Professor.find(@id)
  end
  def update
  	params.permit!
  	@id = params[:id]
  	@professor = Professor.find(@id).update_attributes!(params[:professor])
  	flash[:sucesso] = "#{@professor.nome} foi editado com sucesso."
  	redirect_to professores_url
  end
  def destroy
    @id = params[:id]
  	@professor = Professor.find(@id).destroy
    flash[:sucesso] = "Professor #{@professor.nome} removido."
    redirect_to professores_url
  end
end