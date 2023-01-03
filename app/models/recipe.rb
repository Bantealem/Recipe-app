class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods
   validates :name, presence: true, length: { maximum: 255 }
   validates :description, presence: true, length: { maximum: 500 }
   validates :preparation_time, presence: true
   validates :cooking_time, presence: true
   validates :public, presence: true



end
