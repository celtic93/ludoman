class BetsController < ApplicationController
  def index
    @bets = Bet.ended.with_result(:pending).order_by_tournament_and_started_at
  end

  def update
    bet = Bet.find(params[:id])
    bet.update(bet_params)

    redirect_to root_path
  end

  private

  def bet_params
    params.require(:bet).permit(:result)
  end
end
