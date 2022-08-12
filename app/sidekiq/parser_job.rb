class ParserJob
  include Sidekiq::Job

  def perform(bookmaker)
    ParserService.new.parse_bets(bookmaker)
  end
end
