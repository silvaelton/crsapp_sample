module Site
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    layout 'site/application'


    helper_method :current_candidate, :authenticate_candidate!
    
    private

    def current_candidate
      Site::Candidate.find(session[:candidate_id]) rescue false
    end

    def authenticate_candidate!
      current_candidate
    end

  end
end
