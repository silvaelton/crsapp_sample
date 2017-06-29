module Manager
  class Session
    include ActiveModel::Model 

    attr_accessor :email, :password, :id 
    
    validates :email, :password, presence: true
    validate :authenticate!

    private

    def authenticate!
      user = Manager::User.where(email: self.email, password: self.password).first rescue nil
      
      if user.nil?
        errors.add(:email, "Usuário ou senha não conferem")
      else
        self.id = user.id 
      end      
    end

  end
end