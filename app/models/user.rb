class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
end
#confirmable-> users will have to confirm their e-mails after sign up
#lockable-> users' accounts will be locked out after a number of unsuccessful sign up.