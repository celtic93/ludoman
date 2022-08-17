class Bet < ApplicationRecord
  ENOUGH_TIME_FOR_SPORT_EVENT = 3.hours
  OVERVALUE = 10

  validates :event_name, :tournament, :sport, :market, :market_details,
            :coefficient, :overvalue, :started_at, presence: true
  validates :event_name, uniqueness: { scope: :market }
  validates :overvalue, numericality: { greater_than_or_equal_to: OVERVALUE }, if: :bookmaker_p?

  scope :ended, -> { where('started_at < ?', ENOUGH_TIME_FOR_SPORT_EVENT.ago) }
  scope :order_by_event_info, -> { order(:sport, :tournament, :event_name, :started_at) }
  scope :overvalued, -> { where('overvalue >= ?', OVERVALUE) }

  enumerize :result, in: %i[pending won lost draw], predicates: true, scope: true
  enumerize :bookmaker, in: %i[p m], predicates: { prefix: true }, scope: true
end
