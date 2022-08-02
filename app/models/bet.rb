class Bet < ApplicationRecord
  validates :event_name, :tournament, :market, :market_details, :coefficient, :overvalue, :started_at, presence: true
  validates :event_name, uniqueness: { scope: :market }

  scope :ended, -> { where('started_at < ?', 3.hours.ago) }
  scope :order_by_event_info, -> { order(:tournament, :event_name, :started_at) }

  enumerize :result, in: %i[pending won lost draw], predicates: true, scope: true
end
