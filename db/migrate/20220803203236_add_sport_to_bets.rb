class AddSportToBets < ActiveRecord::Migration[7.0]
  def change
    add_column :bets, :sport, :string

    Bet.where(sport: nil).update_all(sport: 'You guess')
  end
end
