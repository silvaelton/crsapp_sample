class Candidate < ApplicationRecord
  enum status: ['processando', 'homologado', 'indeferido']
  enum gender: ['masculino', 'feminino', 'outro']
end
