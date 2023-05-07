class TelegramNotifierJob
  include Sidekiq::Job

  def perform(bet_id, personnal = true)
    chat_ids = personnal ? Array.wrap(ENV['TELEGRAM_BOT_CHAT_ID']) : Array.wrap(ENV['TELEGRAM_BOT_BET_CHAT_IDS'].split(','))

    chat_ids.each do |chat_id|
      TelegramNotifierService.new.send_bet(bet_id, chat_id)
    end
  end
end
