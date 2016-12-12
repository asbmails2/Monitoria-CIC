require 'rails_helper'

RSpec.describe CandidatosController, :type => :controller do

	before :each do
    	@candidato = Candidato.create(:nome => 'Candidato Teste',
									:matricula => '10123456',
									:monitoria =>'Remunerada',
									:semestre => 4, :prioridade => 0)
	end

   describe 'Carregar pagina inicial' do
   	   it 'Carregando o index' do
   	   		get :index
       		expect(response).to render_template(:index)
       end
   end

   describe 'Carregar o cadastro' do
       it  'Carregar cadastro de candidato' do
       		get :new
       		expect(response).to render_template(:new)
       end
   end

   describe  'Cadastrar Candidato' do
	   it  'Cadastrar candidato' do
       		expect(@candidato.nome).to eq("Candidato Teste")
       		expect(@candidato.matricula).to eq("10123456")
			expect(@candidato.monitoria).to eq("Remunerada")
			expect(@candidato.semestre).to eq(4)
       		expect(@candidato.prioridade).to eq(0)
       end
   end

end
