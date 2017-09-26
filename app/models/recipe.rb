class Recipe < ActiveRecord::Base
  validates :name, :explain, :ingredients, :directions, :image, presence: true
  belongs_to :user
  has_many :likes,dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader

  def like_user(id)
    likes.find_by(user_id: id)
  end

  def self.search(search)
    if search
      Recipe.where(['name LIKE ?', "%#{search}%"])
      Recipe.where(['ingredients LIKE ?', "%#{search}%"])
    else
      Recipe.all
    end
  end
end
