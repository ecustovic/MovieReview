class Movie < ApplicationRecord
  before_save :set_slug

  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :fans, through: :favourites, source: :user
  has_many :characterizations, dependent: :destroy
  has_many :genres, through: :characterizations
  has_many_attached :images

  validates :title, presence: true, uniqueness: true
  validates :released_on, presence: true
  validates :description, length: { minimum: 25 }
  validates :total_gross, numericality: { greater_than_or_equal_to: 0}
  validate :image_type

  RATINGS = %w(G PG PG-13 R NC-17)
  validates :rating, inclusion: { in: RATINGS }

  scope :released, -> { where("released_on < ?", Time.now).order("released_on desc")}
  scope :upcoming, -> { where("released_on > ?", Time.now).order("released_on asc")}
  scope :recent, ->(max=5) {released.limit(max)}
  scope :hits, -> { released.where("total_gross >= 300000000").order(total_gross: :desc)}
  scope :flops, -> { released.where("total_gross < 22500000").order(total_gross: :asc)}
  scope :grossed_less_than, -> (amount) { released.where("total_gross < ?", amount)}
  scope :grossed_greater_than, -> (amount) { released.where("total_gross > ?", amount)}

  def average_stars
    reviews.average(:stars) || 0.0
  end

  def average_stars_as_percent
    (self.average_stars / 5.0) * 100
  end

  def flop?
    total_gross < 22500000
  end
  
  def to_param
    slug
  end

  def thumbnail input
    return self.images[input].variant(resize: '300x300').processed
  end

  def self.search (search)
    if search
      where(["lower(title) LIKE ?", "%#{search.downcase}%"])
    else
      all
    end
  end

private 
  def set_slug
    self.slug = title.parameterize
  end

  def image_type
    if images.attached? == false
      errors.add(:images, "are missing!")
    end
    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:images, " format needs to be JPEG or PNG")
      end
    end
  end
end