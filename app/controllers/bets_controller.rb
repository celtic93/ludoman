class BetsController < ApplicationController
  before_action :find_bet, only: %i[update destroy]

  def index
    @bets = Bet.overvalued(7).with_bookmaker(:p).with_result(:pending).order(:started_at, :event_name)
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
    params.require(:bet).permit(:result, :started_at)
  end
end
