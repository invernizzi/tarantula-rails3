require 'rubygems'
begin
  gem 'tidy'
  require 'tidy'
rescue Gem::LoadError
  puts "Tidy gem not available -- 'gem install tidy' to get it."
end

if defined? Tidy
  if ENV['TIDY_PATH']
    #we trust the user
    Tidy.path = ENV['TIDY_PATH']
  else
    begin
      #linux
      Tidy.path = '/usr/lib/libtidy.so'
    rescue LoadError
      #I'm a mac
      Tidy.path = '/usr/lib/libtidy.dylib'
    end
  end

  class Relevance::Tarantula::TidyHandler 
    include Relevance::Tarantula
    def initialize(options = {})
      @options = {:show_warnings=>true}.merge(options)
    end
    def handle(result)
      response = result.response
      return unless response.html?
      tidy = Tidy.open(@options) do |tidy|
        xml = tidy.clean(response.body)
        tidy
      end
      unless tidy.errors.blank?
        error_result = result.dup
        error_result.description = "Bad HTML (Tidy)"
        error_result.data = tidy.errors.inspect
        error_result
      end
    end
  end
end
