require 'open-uri'

class KondratioParserService
  ATTRIBUTE_NAME = 'Kondratio'

  def parse_new_posts
    uri = Addressable::URI.parse(ENV['KONDRATIO_BLOG_URL'])
    page = Nokogiri::HTML(URI.open(uri.normalize))
    post_links = page.css('.post-asset .page-header2 a')

    post_links.each do |post_link|
      link_url = post_link.attributes['href'].value
      started_at = Time.now

      event_name = link_url
      tournament = ATTRIBUTE_NAME
      sport = ATTRIBUTE_NAME
      market = ATTRIBUTE_NAME
      market_details = ATTRIBUTE_NAME
      coefficient = 1
      overvalue = 1

      created_bet = Bet.create(
        started_at: started_at,
        event_name: event_name,
        tournament: tournament,
        sport: sport,
        market: market,
        market_details: market_details,
        coefficient: coefficient,
        overvalue: overvalue,
      )
      TelegramNotifierJob.perform_async(created_bet.id) if created_bet.id
    end
  end
end
