class TelegramNotifierJob
  include Sidekiq::Job

  def perform(bet_id)
    TelegramNotifierService.new.send_bet(bet_id)
  end
end
