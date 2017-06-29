class Nav < ApplicationRecord
  belongs_to :page

  enum page_type: ['link','página']
end
