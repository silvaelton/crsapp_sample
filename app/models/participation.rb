class Participation < ApplicationRecord
  belongs_to :candidate
  
  has_many :participation_documents
  has_many :participation_teams

  def complete?
    ParticipationType.all.order(id: :asc).each do |type|
      unless type.complete?(self)
        return false
      end
    end

    return false if self.participation_teams.count == 0

    true
  end
end
