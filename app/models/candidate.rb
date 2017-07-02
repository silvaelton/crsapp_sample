class Candidate < ApplicationRecord
  enum status: ['processando', 'homologado', 'indeferido']
  enum gender: ['masculino', 'feminino']


  mount_uploader :document_one, ::DocumentUploader
  mount_uploader :document_two, ::DocumentUploader
end
