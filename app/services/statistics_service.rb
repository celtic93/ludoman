class StatisticsService
  def count_stats
    result = Result.new
    won_bets = Bet.with_result(:won)
    bets_with_results_count = Bet.without_result(:pending).count

    result.won_count = won_bets.count
    result.draw_count = Bet.with_result(:draw).count
    result.lost_count = Bet.with_result(:lost).count
    result.total_count = bets_with_results_count
    result.profit = won_bets.sum(:coefficient) + result.draw_count - bets_with_results_count
    result.roi = result.profit / bets_with_results_count

    result
  end

  class Result
    attr_accessor :won_count, :draw_count, :lost_count, :total_count, :profit, :roi
  end
end
