require_dependency 'project'

module Manager
  class Project < ::Project

    has_many :pages,      class_name: Manager::Page
    has_many :navs,       class_name: Manager::Nav
    has_many :consults,   class_name: Manager::Consult
  end
end