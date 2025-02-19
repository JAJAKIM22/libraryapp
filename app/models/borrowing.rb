class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :borrowed_on, :due_on, presence: true

  after_create :mark_book_as_unavailable
  after_destroy :mark_book_as_available

  private

  def mark_book_as_unavailable
    book.update(status: false)
  end

  def mark_book_as_available
    book.update(status: true)
  end
end
