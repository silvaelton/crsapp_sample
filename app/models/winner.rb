class Winner < ApplicationRecord
  belongs_to :project

  enum winner_type: ['menção_honrosa','terceiro_lugar', 'segundo_lugar', 'primeiro_lugar']

  validates :participation_id, presence: true
  validate  :winner_type_is_valid?

  private

  def winner_type_is_valid?
    if (!self.menção_honrosa? && self.project.winners.where(winner_type: self.winner_type).present?)
      errors.add(:winner_type, "Já indicado, selecione outro")
    end
  end
end
