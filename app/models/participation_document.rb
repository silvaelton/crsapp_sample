class ParticipationDocument < ApplicationRecord
  belongs_to :participation_type

  validates :document, presence: true

  validates :document, file_size: { less_than_or_equal_to: 8.megabytes, message: "Tamanho inválido, verifique as regras de envio." },
                      file_content_type: { allow: ['image/jpeg', 'image/png', 'application/pdf'], message: "Formato inválido, verifique as regras de envio." }

  mount_uploader :document, ::DocumentUploader
end
