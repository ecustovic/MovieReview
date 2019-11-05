class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourite_movies, through: :favourites, source: :movie

  has_secure_password

  scope :by_name, -> { order(:name)}
  scope :not_admins, -> { by_name.where(admin: false)}

  validates :name, presence: true

  validates :email, presence: true,
                  format: { with: /\S+@\S+/ },
                  uniqueness: { case_sensitive: false }

  validates :username, format: { with: /\A[A-Z0-9]+\z/i },
                  uniqueness: { case_sensitive: false }


end
