require 'rails_helper'

describe OfertasController do

  before :each do
      @oferta = Oferta.create(:nome => "Disciplina Teste", :codigo => "Código Teste")
  end

   describe  'Inserir Oferta' do
     it  'Inserir oferta' do
          expect(@oferta.nome).to eq("Disciplina Teste")
          expect(@oferta.codigo).to eq("Código Teste")
       end
   end
end
