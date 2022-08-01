class BetsController < ApplicationController
  before_action :find_bet, only: %i[update destroy]

  def index
    @bets = Bet.ended.with_result(:pending).order_by_tournament_and_started_at
  end

  def update
    @bet.update(bet_params)

    redirect_to root_path
  end

  def destroy
    @bet.destroy

    redirect_to root_path
  end

  private

  def find_bet
    @bet = Bet.find(params[:id])
  end

  def bet_params
    params.require(:bet).permit(:result)
  end
end
