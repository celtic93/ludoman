class AddBookmakerToBet < ActiveRecord::Migration[7.0]
  def change
    change_column :bets, :sport, :string, comment: "Sport of event"
    add_column :bets, :bookmaker, :string, comment: "Bet's bookmaker"

    Bet.where(bookmaker: nil).update_all(bookmaker: 'p')
  end
end
