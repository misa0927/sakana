class Recipe < ActiveRecord::Base
  validates :name, :explain, :ingredients, :directions, :image, presence: true
  belongs_to :user
  has_many :likes,dependent: :destroy
  has_many :comments, dependent: :destroy

  def like_user(id)
    likes.find_by(user_id: id)
  end

  mount_uploader :image, ImageUploader
end
