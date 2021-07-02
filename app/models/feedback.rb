class Feedback < ApplicationRecord
  belongs_to :user, optional: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Неверный формат почты" }
  validates :text, :name, presence: true
  paginates_per 4
end
