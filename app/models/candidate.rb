class Candidate < ApplicationRecord

  belongs_to :project

  enum status: ['processando', 'homologado', 'indeferido']
  enum gender: ['masculino', 'feminino']

  has_one :participation

  mount_uploader :document_one, ::DocumentUploader
  mount_uploader :document_two, ::DocumentUploader
end
