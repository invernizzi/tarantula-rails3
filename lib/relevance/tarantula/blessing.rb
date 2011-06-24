module Relevance::Tarantula::Blessing

    require 'digest/md5'

    @@BLESSING_FILE = ::Rails.root.to_s + '/test/tarantula/blessed.rb'

    #load the user-defined blessings
    begin
        require "#{@@BLESSING_FILE}"
        blessings = Blessings.blessings
    rescue LoadError => e
        puts "Unable to load blessings file (#{@@BLESSING_FILE}), continuing without it. Exception: #{e.message}"
        blessings = []
    end
    #put the blessings into an Hash of hash :=> list of urls regexps
    @@blessings_hash = Hash.new {|h, k| h[k] = Array.new}
    blessings.each do |url, hash|
            url = /^#{Regexp.quote(url)}$/ if url.class == String
            @@blessings_hash[hash] << url
    end

    def self.is_blessed?(result)
        hash = self.hash_result result
        urls_regexp_array = @@blessings_hash[hash]
        return false unless urls_regexp_array

        urls_regexp_array.each do  |regexp|
            if result.url =~ regexp
                return true
            end
        end
        false
    end

    def self.hash_result (result)
        Digest::MD5.hexdigest("#{result.description}\n#{result.data_blessing || result.data}\n")
    end

    def self.get_blessings_path
        @@BLESSING_FILE
    end


end
