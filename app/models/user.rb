class User < ApplicationRecord
  enum situation: ['visualizador', 'administrador']
end
