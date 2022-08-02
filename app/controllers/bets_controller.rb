class BetsController < ApplicationController
  before_action :find_bet, only: %i[update destroy]

  def index
    @bets = Bet.ended.with_result(:pending).order_by_event_info
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
