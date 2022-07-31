class Bet < ApplicationRecord
  validates :event_name, :tournament, :market, :market_details, :coefficient, :overvalue, :started_at, presence: true
  validates :event_name, uniqueness: { scope: :started_at }

  scope :ended, -> { where('started_at < ?', 3.hours.ago) }
  scope :order_by_tournament_and_started_at, -> { order(:tournament, :started_at) }
end
