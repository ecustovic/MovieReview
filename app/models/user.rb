class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourite_movies, through: :favourites, source: :movie
  has_one_attached :avatar

  scope :by_name, -> { order(:name)}
  scope :not_admins, -> { by_name.where(admin: false)}

  validates :email, presence: true,
                  format: { with: /\S+@\S+/ },
                  uniqueness: { case_sensitive: false }


end
