# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  # Associations
  has_many :products, dependent: :destroy

  # Validations
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password_digest, presence: true
end
