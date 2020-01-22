class Publisher < ApplicationRecord
  has_many :books

  validates :name, :info, presence: true

  mount_uploader :logo, ImageUploader
  

  def first
    #where('fullname LIKE?', "#{letter}").order('fullname ASC')
    return '?' if name.blank?
    name[0].upcase
  end
end
