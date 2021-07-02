class User < ApplicationRecord
  include AvatarUploader::Attachment(:avatar)

  has_many :feedbacks

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :full_name, presence: true
end
