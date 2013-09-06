class Project < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  has_many :permissions, as: :thing

  scope :viewable_by, ->(user) do
    joins(:permissions).where(permissions: { action: "view",
                                             user_id: user.id })
  end

  validates :name, presence: true
end
