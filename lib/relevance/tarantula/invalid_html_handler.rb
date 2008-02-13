class Relevance::Tarantula::InvalidHtmlHandler
  include Relevance::Tarantula
  def handle(method, url, response, referrer, data = nil)
    return unless response.html?
    begin
      body = HTML::Document.new(response.body, true)
    rescue Exception => e
      Result.new(false, method, url, response, referrer, e.message)
    else
      nil
    end
  end
end
