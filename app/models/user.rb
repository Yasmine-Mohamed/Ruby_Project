class User < ActiveRecord::Base
  #validation
  validates :name, :presence => true
  validates :email, :presence => true , :uniqueness => true
  validates :gender, :presence => true
  validates :role , :presence => true
  validates :dob, :presence => true

  #upload image
  mount_uploader :profile_picture, ImageUploader

  #user authentication
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #relations
  has_many :courses
  has_many :lectures
  has_many :comments

  #like and unlike
  acts_as_voter

  #act as instractor or guest
  def instractor?
    self.role == 'instractor'
  end

  def guest?
    self.role == 'guest'
  end

end
