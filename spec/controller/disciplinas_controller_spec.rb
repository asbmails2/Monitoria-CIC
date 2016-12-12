require 'rails_helper'

describe DisciplinasController, :type => :controller  do

  before :each do
      @disciplina = Disciplina.create(:nome => "Disciplina Teste", :codigo => "Código Teste",
        :professor => "Professor Teste", :vagas => 1)
  end

  describe 'Verifica index' do
       it 'Verifica index' do
          get :index
          expect(response).to render_template(:index)
       end
   end

   describe 'Cadastrar Disciplina' do
       it  'Cadastrar Disciplina' do
          get :new
          expect(response).to render_template(:new)
       end
   end

   describe  'Nova disciplina' do
     it  'Nova disciplina' do
          expect(@disciplina.nome).to eq("Disciplina Teste")
          expect(@disciplina.codigo).to eq("Código Teste")
          expect(@disciplina.professor).to eq("Professor Teste")
          expect(@disciplina.vagas).to eq(1)
       end
   end
end
