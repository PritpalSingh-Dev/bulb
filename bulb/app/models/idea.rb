class Idea < ActiveRecord::Base
  belongs_to :user
  acts_as_commentable
  acts_as_votable
  mount_uploader :attachment, AttachmentUploader
end
