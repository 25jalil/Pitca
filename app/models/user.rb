class User < ApplicationRecord
  include UsersHelper
  has_many :orders, dependent: :destroy
  has_many :stores, dependent: :destroy
  has_many :menus, dependent: :destroy

  validates_format_of :email,:with => Devise::email_regexp
  validates :name, presence: true
  validates :role, inclusion: {in: :role}

  enum role: {user: 0, seller: 1, admin: 2}
  after_initialize :self_default_role, if: :new_record?

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
end
