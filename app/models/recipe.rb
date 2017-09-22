class Recipe < ActiveRecord::Base
  validates :name, :explain, :ingredients, :directions, presence: true
  belongs_to :user
  has_many :likes,dependent: :destroy

  def like_user(id)
    likes.find_by(user_id: id)
  end
end
