require 'rails_helper'
#versao 3.5.4 do rspec

RSpec.describe ProfessoresController, :type => :controller do

	before :each do
    	@professor = Professor.create(:nome => "Professor Teste", :email => "Email Teste", :sala => "Sala Teste")
	end

   describe 'Carregar pagina inicial' do
   	   it 'Carregando o index' do
   	   		get :index
       		expect(response).to render_template(:index)
       end
   end

   describe 'Carregar o cadastro' do
       it  'Carregar cadastro de professor' do
       		get :new
       		expect(response).to render_template(:new)
       end
   end

   describe  'Cadastrar Professor' do
	   it  'Cadastrar professor' do
       		expect(@professor.nome).to eq("Professor Teste")
       		expect(@professor.email).to eq("Email Teste")
       		expect(@professor.sala).to eq("Sala Teste")
       end
   end
end
