class Author < ApplicationRecord
  has_many :books

  #validates :fullname, presence: true

  mount_uploader :image, ImageUploader

  def first
    #where('fullname LIKE?', "#{letter}").order('fullname ASC')
    return '?' if fullname.blank?
    fullname[0].upcase
  end
  
end