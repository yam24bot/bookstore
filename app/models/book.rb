class Book < ApplicationRecord
  mount_uploader :envelope, EnvelopeUploader
  mount_uploader :file, FileUploader

  belongs_to :user

  has_many :taggings, :dependent => :destroy
  has_many :tags, through: :taggings, :dependent => :destroy

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  validates :title, :author, :envelope, :file, presence: true
end
