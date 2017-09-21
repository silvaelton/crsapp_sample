class QuestionOne < ApplicationRecord


  validates :candidate_id, :project_id, :answer, presence: true
  validates :candidate_id, uniqueness: true
  validate  :candidate_id_exist?

  enum answer: ['mídias_sociais', 'site_do_cau','site_do_IAB','sites_especializados','outros']

  private

  def candidate_id_exist?
    candidate = ::Candidate.where(project_id: self.project_id).find(self.candidate_id) rescue nil
    
    if candidate.nil?
      errors.add(:candidate_id, "Nº de inscrição não encontrado")
    end

  end
end
