require_dependency 'nav'

module Manager
  class Nav < ::Nav
    belongs_to :page, class_name: Manager::Page

    validates :label, :page_type, :order, presence: true
    validates :page, presence: true, if: 'self.página?'
    validates :url, presence: true, if: 'self.link?'
  end
end