require_dependency 'candidate'
require_dependency 'document_uploader'

module Site
  class Candidate < ::Candidate
    
    attr_accessor :password_confirmation
    
    #validates_uniqueness_of :cpf,   scope: :project_id
    #validates_uniqueness_of :cnpj,  scope: :project_id

    validates :name, presence: true
    validates :cpf, cpf: true, presence: true
    validates :cnpj, cnpj: true, presence: true

    validates :rg, :gender, :born, :cep, :uf, :city, :burgh, :address, presence: true
    validates :uf, length: { minimum: 2, maximum: 2}
    validates :email, email: true, presence: true
    validates :telephone, :celphone, presence: true
    validates :fantasy_name, :social_reason, presence: true
    validates :document_one, :document_two, presence: true
    validates :terms_use, presence: true
    validates :password, :password_confirmation, presence: true, on: :create
    validates :password, :password_confirmation, length: {minimum: 6, maximum: 18}, on: :create
    validate  :password_equal, on: :create

    validates :document_one, :document_two, 
              file_size: { less_than_or_equal_to: 5.megabytes },
              file_content_type: { allow: ['image/jpeg', 'image/png', 'application/pdf'] } 


    mount_uploader :document_one, ::DocumentUploader
    mount_uploader :document_two, ::DocumentUploader

    private

    def password_equal
      if self.password != self.password_confirmation
        errors.add(:password, "Senhas não são iguais")
      end
    end

  end
end