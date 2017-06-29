require_dependency 'page'

module Site
  class Consult < ::Consult 
    validates :content, presence: true
  end
end