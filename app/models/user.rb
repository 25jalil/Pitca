class User < ApplicationRecord

  enum role: [:user, :seller, :admin]
  after_initialize :self_default_role, if: :new_record?

  def self_default_role
    self.role ||= :user
  end

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
end
