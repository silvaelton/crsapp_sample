class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def json_email
    @candidates = Candidate.where(status: 0).map(&:email)

    render json: @candidates
  end
end
