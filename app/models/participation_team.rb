class ParticipationTeam < ApplicationRecord
  validates :name,:job, presence: true
end
