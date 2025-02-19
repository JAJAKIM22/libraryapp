class BorrowingsController < ApplicationController
    before_action :require_authentication

  def index
    @borrowings = Current.session.user.borrowings.includes(:book)
  end
end
