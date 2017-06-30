class Consult < ApplicationRecord
  enum situation: ['Não lida', 'Lida', 'Respondida']
end
