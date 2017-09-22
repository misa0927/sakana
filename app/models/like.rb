class Like < ActiveRecord::Base
  belongs_to :recipes
  belongs_to :user
end
