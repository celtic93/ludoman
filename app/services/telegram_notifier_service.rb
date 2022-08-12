class TelegramNotifierService
  def send_bet(bet_id)
    bet = Bet.find(bet_id)

    HTTParty.post("https://api.telegram.org/bot#{ENV['TELEGRAM_BOT_API_KEY']}/sendMessage",
                  headers: {
                    'Content-Type' => 'application/json'
                  },
                  body: {
                    chat_id: ENV['TELEGRAM_BOT_CHAT_ID'],
                    text: bet_text(bet)
                  }.to_json)
  end

  private

  def bet_text(bet)
    "#{bet.started_at.strftime('%d-%m-%Y %H:%M')}\n"\
    "#{bet.event_name}\n"\
    "#{bet.market} (#{bet.market_details})\n"\
    "#{bet.coefficient}\n"\
    "#{bet.sport} - #{bet.tournament}"
  end
end
