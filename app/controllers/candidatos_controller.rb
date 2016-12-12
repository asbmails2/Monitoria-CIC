# This file is app/controllers/movies_controller.rb
class CandidatosController < ApplicationController
	def index
		@candidatos = Candidato.all
	end

	def procura_candidato_create(dados_candidato, params_candidato)
		nome = dados_candidato[0]
	  if Candidato.exists?(:nome => nome, :matricula => dados_candidato[1])
		flash[:aviso] = "O candidato #{nome} não foi incluído pois já existe."
	  else
		candidato_cadastrado = Candidato.create!(params_candidato)
		flash[:sucesso] = "#{candidato_cadastrado.nome} incluído com sucesso."
	  end
	end

	def procura_candidato_update(dados_candidato, candidato_modificado)
      nome = dados_candidato[0]
      if Candidato.exists?(:nome => nome, :matricula => dados_candidato[1])
        flash[:aviso] = "O candidato #{nome} não foi modificado pois já existe."
      else
        if candidato_modificado.update_attributes!(params[:candidato])
          flash[:sucesso] = "#{candidato_modificado.nome} foi editado com sucesso."
        end
      end
    end

	def show
		id = params[:id]
		@candidato = Candidato.find(id)
	end

	def new
		@candidato = Candidato.new
	end

	def create
		candidato = params.require(:candidato).permit(:nome,:matricula,:monitoria,:semestre)
	  	parray = candidato.values
	    procura_candidato_create(parray, candidato)

	  	redirect_to candidatos_url
	end

	def edit
		@candidato = Candidato.find params[:id]
	end

	def update
		params.permit!
	  	@candidato = Candidato.find(params[:id])
	  	parray = params.require(:candidato).permit(:nome,:matricula,:monitoria,:semestre,:prioridade).values

	    procura_candidato_update(parray, @candidato)

	  	redirect_to candidatos_url
	end

	def destroy
		candidato = Candidato.find(params[:id]).destroy
	    flash[:sucesso] = "Candidato #{candidato.nome} removido com sucesso."
	    redirect_to candidatos_url
	end
end
