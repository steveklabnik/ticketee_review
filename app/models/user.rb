class User < ActiveRecord::Base
  has_secure_password

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end
end
