class Work < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :title,       presence: true
  validates :artist,      presence: true
  validates :type,        numericality: { other_than: 0} 

  belongs_to :type
end
