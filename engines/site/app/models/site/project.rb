require_dependency 'project'

module Site
  class Project < ::Project 
    has_many :consults, class_name: Site::Consult
  end
end