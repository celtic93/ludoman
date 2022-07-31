class AddResultToBets < ActiveRecord::Migration[7.0]
  def change
    add_column :bets, :result, :string, default: 'pending', comment: 'The result of event'
  end
end
