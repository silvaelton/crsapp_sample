class Participation < ApplicationRecord

  has_many :participation_documents

  def complete?
    ParticipationType.all.order(id: :asc).each do |type|
      unless type.complete?(self)
        return false
      end
    end
    true
  end
end
