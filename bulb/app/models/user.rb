class User < ActiveRecord::Base
  has_many :ideas
  belongs_to :company
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter
  
  mount_uploader :image, UserUploader

  # User::Roles
  # The available roles
  Roles = [ :admin , :default ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end
end
