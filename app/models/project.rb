class Project < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  has_many :permissions, as: :thing

  validates :name, presence: true

  scope :viewable_by, ->(user) do
    joins(:permissions).where(permissions: { action: "view",
                                             user_id: user.id })
  end

  scope :for, ->(user) do
    user.admin? ? Project.all : Project.viewable_by(user)
  end
end
