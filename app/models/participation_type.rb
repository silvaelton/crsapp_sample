class ParticipationType < ApplicationRecord
  has_many :participation_documents

  def deny_form?(participation)
    documents = ParticipationDocument.where(participation_id: participation.id, participation_type_id: self.id)
    case self.id
    when 1
      (documents.count == 15)
    when 2
      (documents.count == 3)
    when 3
      documents.count == 1
    when 4
      documents.count == 1
    when 5
      documents.count == 3
    when 6
      documents.count == 1
    end
  end

  def complete?(participation)
    documents = ParticipationDocument.where(participation_id: participation.id, participation_type_id: self.id)
    case self.id
    when 1
      (documents.count >= 5 && documents.count <= 15)
    when 2
      (documents.count >= 1 && documents.count <= 3)
    when 3
      documents.count == 1
    when 4
      documents.count == 1
    when 5
      documents.count == 3
    when 6
      documents.count == 1
    end
  end

end
