module UsersHelper
  def self_default_role
    if User.count == 0
      self.role ||= :admin
    else
      self.role ||= :user
    end
  end
end
