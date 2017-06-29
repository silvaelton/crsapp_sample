require_dependency 'page'

module Manager
  class Page < ::Page
    validates :name, :content, presence: true
  end
end