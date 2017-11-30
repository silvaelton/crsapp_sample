class Winner < ApplicationRecord
  belongs_to :project
  belongs_to :participation

  enum winner_type: ['menção_honrosa','terceiro_lugar', 'segundo_lugar', 'primeiro_lugar']

  validates :participation_id, :winner_type, presence: true
  validates_uniqueness_of :participation_id, scope: :winner_type, unless: 'self.menção_honrosa?'

  validate :participation_present?

  private

  def participation_present?
    if !Participation.where(id: self.participation_id, closed: true).present?
      errors.add(:participation_id, 'Projeto não existe')
    end
  end
end
