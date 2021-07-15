class Work < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :title,        presence: true
  validates :artist_id,    numericality: { other_than: 0} 
  validates :type_id,      numericality: { other_than: 0} 

  belongs_to :type
  belongs_to :author
end
