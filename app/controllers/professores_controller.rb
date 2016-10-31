class ProfessoresController < ApplicationController
  def index
    @professors = Professor.all
  end
end