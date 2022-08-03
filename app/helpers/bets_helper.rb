module BetsHelper
  def google_search_link(event_name)
    link_to event_name, "https://www.google.com/search?q=#{event_name}", target: '_blank', rel: 'noopener noreferrer'
  end
end
