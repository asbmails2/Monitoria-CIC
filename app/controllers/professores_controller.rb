# Controller Responsável pelo CRUD da sessão de professores. 
# Cria, edita, mostra detalhes e deleta um elemento.

class ProfessoresController < ApplicationController
  def index
    @professors = Professor.all
  end
  def new  	 	
  	@professors = Professor.new
  end
  def create
  	professor = params.require(:professor).permit(:nome, :email, :sala)
  	parray = professor.values
    procura_professor_create(parray, professor)

  	redirect_to professores_url
  end
  def procura_professor_create(dados_professor, params_professor)
    nome = dados_professor[0]
    if Professor.exists?(:nome => nome, :email => dados_professor[1])
      flash[:aviso] = "O professor #{nome} não foi incluído pois já existe."
    else  
      professor_cadastrado = Professor.create!(params_professor)
      flash[:sucesso] = "#{professor_cadastrado.nome} incluído com sucesso."
    end
  end
  def edit
  	@professor = Professor.find(params[:id])
  end
  def update
  	params.permit!
  	@professor = Professor.find(params[:id])
  	parray = params.require(:professor).permit(:nome, :email, :sala).values
  	  	
    procura_professor_update(parray, @professor)

  	redirect_to professores_url
  end
  def procura_professor_update(dados_professor, professor_modificado)
    nome = dados_professor[0]
    if Professor.exists?(:nome => nome, :email => dados_professor[1], :sala => dados_professor[2])
      flash[:aviso] = "O professor #{nome} não foi modificado pois já existe."
    else  
      if professor_modificado.update_attributes!(params[:professor])
        flash[:sucesso] = "#{professor_modificado.nome} foi editado com sucesso."
      end
    end
  end
  def destroy
  	professor = Professor.find(params[:id]).destroy
    flash[:sucesso] = "Professor #{professor.nome} removido com sucesso."
    redirect_to professores_url
  end
  def show
  	@professor = Professor.find(params[:id])
  end
end