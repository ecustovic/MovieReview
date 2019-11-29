class Actor < ApplicationRecord
  has_one_attached :image
  enum gender: [ :male, :female ]

  validates :name, presence: true, uniqueness: true
  validates :birth_date, presence: true
  validate :image_type

  private
  def image_type
    if image.attached? == false
      errors.add(:image, "is missing!")
    end
  end
end
