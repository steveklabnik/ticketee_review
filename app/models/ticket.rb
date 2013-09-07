class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true,
                          length: { minimum: 10 }

  mount_uploader :asset, AssetUploader
end
