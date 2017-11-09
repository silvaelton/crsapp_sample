class ParticipationDocument < ApplicationRecord
  belongs_to :participation_type

  validates :document, presence: true

  validates :document, file_size: {
                        less_than_or_equal_to: 3.megabytes,
                        message: "Tamanho inválido, verifique as regras de envio." },
                      file_content_type: {
                        allow: ['application/pdf'],
                        message: "Formato inválido, verifique as regras de envio." }, if: :pdf3?

  validates :document, file_size: {
                        less_than_or_equal_to: 8.megabytes,
                        message: "Tamanho inválido, verifique as regras de envio." },
                      file_content_type: {
                        allow: ['application/pdf'],
                        message: "Formato inválido, verifique as regras de envio." }, if: :pdf8?

  validates :document, file_size: {
                        less_than_or_equal_to: 3.megabytes,
                        message: "Tamanho inválido, verifique as regras de envio." },
                      file_content_type: {
                        allow: ['image/jpeg'],
                        message: "Formato inválido, verifique as regras de envio." }, if: :image3?

  validates :document, file_size: {
                        less_than_or_equal_to: 8.megabytes,
                        message: "Tamanho inválido, verifique as regras de envio." },
                      file_content_type: {
                        allow: ['image/jpeg'],
                        message: "Formato inválido, verifique as regras de envio." }, if: :image8?

  mount_uploader :document, ::DocumentUploader

  private

  def pdf3?
    [3,6].include? self.participation_type_id
  end

  def pdf8?
    [1,2].include? self.participation_type_id
  end

  def image3?
    [4].include? self.participation_type_id
  end

  def image8?
    [5].include? self.participation_type_id
  end
end
