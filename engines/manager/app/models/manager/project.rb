require_dependency 'project'

module Manager
  class Project < ::Project

    has_many :pages,      class_name: Manager::Page
    has_many :navs,       class_name: Manager::Nav
    has_many :consults,   class_name: Manager::Consult

    validates :title, presence: true
    validates :mini_description, presence: true
    validates :home_page_id, presence: true 
    validates :start, :end, presence: true
  end
end