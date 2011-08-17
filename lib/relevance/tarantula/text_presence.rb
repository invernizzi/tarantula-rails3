class Relevance::Tarantula::TextPresence
  include Relevance::Tarantula

  def initialize(text, error_name, error_description="", ignore_http_codes=[])
    @text = text
    @error_name = error_name
    @error_description = error_description
    @ignore_http_codes = ignore_http_codes
  end

  def handle(result)
    response = result.response
    error_results = []
    if response.content_type.to_s == "text/html" and
      not @ignore_http_codes.include? response.status and
      not response.body =~ /#{Regexp.escape @text}/
      error_result = result.dup
      error_result.description = @error_name
      error_result.data = @error_description
      error_results << error_result
    end
    error_results
  end
end
