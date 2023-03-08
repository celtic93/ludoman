class KondratioParserJob
  include Sidekiq::Job

  def perform
    KondratioParserService.new.parse_new_posts
  end
end
