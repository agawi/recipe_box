class Recipe < ApplicationRecord
  belongs_to :user
  has_attached_file :image, styles: { medium: "400x400>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :ingredients
  has_many :directions
  accepts_nested_attributes_for :ingredients, :directions, reject_if: :all_blank, allow_destroy: true



  #accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
end
