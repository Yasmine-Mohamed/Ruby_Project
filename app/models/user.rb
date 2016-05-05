class User < ActiveRecord::Base
  mount_uploader :profile_picture, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :courses
  has_many :lectures
  has_many :comments
  acts_as_voter

  def instractor?
    self.role == 'instractor'
  end

  def guest?
    self.role == 'guest'
  end

end
