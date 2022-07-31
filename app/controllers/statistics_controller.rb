class StatisticsController < ApplicationController
  def index
    @statistics = StatisticsService.new.count_stats
  end
end
