class User < ApplicationRecord
  include UsersHelper
  has_many :orders, dependent: :destroy

  validates_format_of :email,:with => Devise::email_regexp
  validates :role, inclusion: {in: :role}

  enum role: {user: 0, seller: 1, admin: 2}
  after_initialize :self_default_role, if: :new_record?

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable
end
