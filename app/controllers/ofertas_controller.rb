class OfertasController < ApplicationController
  def index
    @ofertas = Oferta.all
  end
  def new
    @ofertas = Oferta.new
  end
  def create
    @ofertas = Oferta.create!(params.require(:disciplina).permit(:nome, :codigo))
    flash[:sucesso] = "#{@oferta.nome} incluída com sucesso."
    redirect_to disciplinas_url #deve mudar para gerencia de bolsas
  end
  def show
    @id = params[:id]
    @oferta = Oferta.find(@id)
  end
end
