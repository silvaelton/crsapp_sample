class Resource < ApplicationRecord

  attr_accessor :password

  validates :candidate_id, :message, presence: true

  validate :candidate_authenticate?

  private

  def candidate_authenticate?
    @candidate = Candidate.find(self.candidate_id) rescue nil

    if @candidate.nil?
      errors.add(:candidate_id, 'Candidato ou senha inválidos')
    else
      if @candidate.password == self.password
        unless Participation.where(candidate_id: self.candidate_id, closed: true).present?
          errors.add(:candidate_id, "Não é possível enviar o recurso, o candidato não enviou sua participação")
        end
      else
        errors.add(:candidate_id, 'Candidato ou senha inválidos')
      end
    end
  end
end
