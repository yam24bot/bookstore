class Tag < ApplicationRecord

  has_many :taggings,:dependent => :destroy
  has_many :books, through: :taggings

end
