class Bet < ApplicationRecord
  validates :event_name, :tournament, :market, :market_details, :coefficient, :overvalue, :started_at, presence: true
  validates :event_name, uniqueness: { scope: :started_at }
end
