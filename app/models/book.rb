#require 'elasticsearch/rails'
#require 'elasticsearch/model'
class Book < ApplicationRecord
  #include Elasticsearch::Model
  #include Elasticsearch::Model::Callbacks
  before_destroy :not_refernced_by_any_line_item

  validates :name, :pages, :cover, :isbn, :age, :description, :price, :author_id, :publisher_id, :theme_id, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, uniqueness: true

  validates_associated :author
  validates_associated :publisher
  validates_associated :theme

  belongs_to :author
  belongs_to :theme
  belongs_to :publisher
  has_many :line_items

  mount_uploader :logo, LogoUploader
  mount_uploader :images, ImageUploader

  

  def not_refernced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line items present')
      throw :abort
    end
  end

  #def self.search_elastic(query)
  #  if query
  #    self.search({
        #response = Book.__elasticsearch__.search{
  #      query: {
  #        multy_match: {
  #          query: query,
  #          fields:['name', 'author.fullname']
  #        }
  #      }
  #    })#.results

      #render json:{
      #  result: response.results
      # total: response.total
      #}
  #  else
  #    all
  #  end
  #end
  def self.search(search)
    if search
      where('name like ?', "%#{search}%")
    else
      all
    end
  end
      #search_elastic(query)
      #__elasticsearch__.search(
      #  {
      #    query: {
      #      multi_match: {
      #        query: query,
      #        fields: ['name', 'author.fullname']
      #      }
      #    },
      #    highlight: {
      #      pre_tags: ['<em>'],
      #      post_tags: ['<em>'],
      #      fields: {
      #        name: {},
      #        text: {}
      #      }

      #    }
      #  }
      #  )
    

  #def search_elastic(query)
    
  #end
end

#Book.import force: true
