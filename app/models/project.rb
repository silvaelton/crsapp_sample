class Project < ApplicationRecord
  extend FriendlyId
  
  friendly_id :title, use: :slugged 

  has_many :navs
  has_many :pages
  has_many :consults
  has_many :candidates
end
