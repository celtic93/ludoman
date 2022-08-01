require 'open-uri'

class ParserService
  def parse_bets
    uri = Addressable::URI.parse(ENV['PARSER_URL'])
    page = Nokogiri::HTML(URI.open(uri.normalize))
    bets = page.css('.app-table tbody')

    bets.each do |bet|
      started_at_value = bet.css('.time').attr('data-utc').value.to_i
      started_at = Time.at(started_at_value / 1000).in_time_zone('Moscow')

      event_name = bet.css('.event a').text
      tournament = bet.css('.event .minor').text
      market = bet.css('.coeff abbr').text
      market_details = bet.css('.coeff abbr').attr('title').value
      coefficient = bet.css('.value').text.to_f
      overvalue = bet.css('.text-center').last.text.to_f

      Bet.create(
        started_at: started_at,
        event_name: event_name,
        tournament: tournament,
        market: market,
        market_details: market_details,
        coefficient: coefficient,
        overvalue: overvalue
      )
    end
  end
end
