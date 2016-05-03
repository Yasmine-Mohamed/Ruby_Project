class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :comments
  acts_as_votable
  mount_uploader :attachment , AttachmentUploader

end
