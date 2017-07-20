module UsersHelper
  def self_default_role
    if User.count == 0
      self.role ||= :admin
    end
  end
end
