require 'rails_helper'

describe ProfessoresController do

	before :each do
    	@professor = Professor.create(:nome => "Professor Teste", :email => "Email Teste", :sala => "Sala Teste")
	end

   describe  'Cadastrar Professor' do  
	   it  'Cadastrar professor' do 
       		expect(@professor.nome).to eq("Professor Teste")
       		expect(@professor.email).to eq("Email Teste")
       		expect(@professor.sala).to eq("Sala Teste")
       end 
   end 
end