class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  #config.autoload_paths << Rails.root.join('lib')
  #config.autoload_paths += Dir["#{config.root}/lib/**/"]
end
