class User < ApplicationRecord
  enum situation: ['coordenador', 'administrador']
end
