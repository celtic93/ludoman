class BetsController < ApplicationController
  def index
    @bets = Bet.ended.order_by_tournament_and_started_at
  end
end
