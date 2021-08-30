class Work < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :title,        presence: true
  validates :artist_id,    numericality: { other_than: 0} 
  validates :type_id,      numericality: { other_than: 0} 

  has_many_attached :images
  belongs_to_active_hash :type
  belongs_to_active_hash :creater
end
