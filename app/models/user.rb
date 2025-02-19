class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_many :borrowings, dependent: :destroy
  has_many :borrowed_books, through: :borrowings, source: :book
end
