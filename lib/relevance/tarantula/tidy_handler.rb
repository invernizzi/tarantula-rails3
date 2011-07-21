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
      begin
        Tidy.path = '/usr/lib/libtidy.dylib'
      rescue LoadError
        puts "Tidy library not found, install it"
      end
    end
  end

  class Relevance::Tarantula::TidyHandler 
    include Relevance::Tarantula
    def initialize(options = {})
      @options = {:show_warnings=>true,
                  :char_encoding=>'utf8'}.merge(options)
    end
    def handle(result)
      return unless Tidy.path
      response = result.response
      return unless response.html?
      tidy = Tidy.open(@options) do |tidy|
        xml = tidy.clean(response.body)
        tidy
      end
      unless tidy.errors.blank?
        error_results = []
        tidy.errors[0].split(/\n/).each do |error|
            # ignore proprietary attributes
            next if error.include? "proprietary"
            error_result = result.dup
            error_result.description = "Bad HTML (Tidy)"
            error_result.data = error.inspect
            # removing the line and column information to let developers suppress a
            # warning with the Blessing module
            error_result.data_blessing = error_result.data.gsub(/line\s+\d+\s+column\s+\d+/i, "")
            error_results << error_result
        end
        error_results
      end
    end
  end
end
