class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    if (current_user.student_role? && Candidato.find_by(id_of_user: current_user.id)==nil)
      new_candidato_url
    end
    if (current_user.professor_role? && Professor.find_by(id_of_user: current_user.id)==nil)
      new_professore_url
    end
  end
end
