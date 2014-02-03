class User < ActiveRecord::Base
  has_secure_password
  has_many :permissions

  before_create :generate_token

  validates :email, presence: true

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

  private

    def generate_token
      self.token = SecureRandom.uuid
    end
end
