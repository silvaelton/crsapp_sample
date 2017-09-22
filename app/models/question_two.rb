class QuestionTwo < ApplicationRecord

  attr_accessor :password

  validates :candidate_id, :project_id, :term_use, :name,  presence: true 
  validates :cpf, cpf: true, presence: true
  validates :password, presence: true


  validate :verify_data

  private

  def verify_data
    candidate = ::Candidate.where(project_id: self.project_id).find(self.candidate_id) rescue nil
  

    if candidate.nil?
      errors.add(:candidate_id, "Nº de inscrição não encontrado")
    else
      question_two = ::QuestionTwo.find_by(candidate_id: self.candidate_id) rescue nil

      if !question_two.nil?
        errors.add(:candidate_id, "Inscrição já realizou a indicação")
      end

      if candidate.password != self.password
        errors.add(:candidate_id, "Senha ou Nº de inscrição incorreto")
      end
    end

  end

end
