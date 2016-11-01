# This file is app/controllers/movies_controller.rb
class CandidatosController < ApplicationController
	def index
		@candidatos = Candidato.all
	end

	def show
		id = params[:id]
		@candidato = Candidato.find(id)
	end

	def new
		@candidato = Candidato.new
	end

	def create
		permitted = params.require(:candidato).permit(:nome,:matricula,:monitoria,:semestre)
		@candidato = Candidato.create!(permitted)
		flash[:notice] = "Candidato #{@candidato.nome} de matrícula #{@candidato.matricula} foi adicionado com sucesso."
		redirect_to candidatos_path
	end

	def edit
		@candidato = Candidato.find params[:id]
	end

	def update
		permitted = params.require(:candidato).permit(:nome,:matricula,:monitoria,:semestre,:prioridade)
		@candidato = Candidato.find params[:id]
		@candidato.update_attributes!(permitted)
		flash[:notice] = "Classificação do aluno #{@candidato.nome} de matrícula #{@candidato.matricula} foi atualizada com sucesso."
		redirect_to candidato_path(@candidato)
	end

	def destroy
		@candidato = Candidato.find(params[:id])
		@candidato.destroy
		flash[:notice] = "Candidato excluído."
		redirect_to candidatos_path
	end
end
