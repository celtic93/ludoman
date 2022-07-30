class ParserJob
  include Sidekiq::Job

  def perform
    ParserService.new.parse_bets
  end
end
