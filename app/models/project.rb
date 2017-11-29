class Project < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged

  has_many :navs
  has_many :pages
  has_many :consults
  has_many :candidates
  has_many :winners

  belongs_to :home_page, class_name: ::Page

  enum situation: ['em_desenvolvimento', 'em_produção', 'fechado']
end
