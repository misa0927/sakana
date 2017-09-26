class Recipe < ActiveRecord::Base
  validates :name, :explain, :ingredients, :directions, presence: true
  belongs_to :user
  has_many :likes,dependent: :destroy
  has_many :comments, dependent: :destroy
end
