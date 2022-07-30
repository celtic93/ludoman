class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets, comment: 'Bets table' do |t|
      t.string :event_name, comment: 'Event name'
      t.string :tournament, comment: "Event's tournament"
      t.string :market, comment: 'The market on which the bet is made'
      t.string :market_details, comment: 'The market on which the bet is made with details'
      t.decimal :coefficient, comment: 'Betting coefficient'
      t.decimal :overvalue, comment: 'Betting coefficient'
      t.datetime :started_at, comment: 'Event start date and time'

      t.timestamps
    end
  end
end
