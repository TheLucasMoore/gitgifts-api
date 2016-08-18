class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :projects
  has_many :rewards, through: :projects

  validates :github, uniqueness: true, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def self.from_omniauth(auth)
    # raise auth.inspect
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.github = auth.extra.raw_info.login
      user.github_url = auth.extra.raw_info.html_url
      user.avatar_url = auth.info.image
      user.city = auth.extra.raw_info.location
      user.bio = auth.extra.raw_info.bio
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
