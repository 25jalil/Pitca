class User < ApplicationRecord
  include UsersHelper
  has_many :ordered_products
  has_many :stores

  validates_format_of :email,:with => Devise::email_regexp
  validates_associated :ordered_products
  validates_associated :stores

  enum role: {seller: 0, user: 1, admin: 2}
  after_initialize :self_default_role, if: :new_record?

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
end
