module Site
  class Session
    include ActiveModel::Model 

    attr_accessor :candidate_id, :password, :id 
    
    validates :candidate_id, :password, presence: true
    validate  :authenticate!

    private

    def authenticate!
      user = Site::Candidate.where(id: self.candidate_id, password: self.password).first rescue nil
      
      if user.nil?
        errors.add(:candidate_id, "Inscrição ou senha não conferem")
      else
        self.id = user.id 
      end      
    end

  end
end