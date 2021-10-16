require "net/http"
require "open-uri"
require "json"
require "pry"
# require "awesome_print"

class GetRequester

    @@all = []

    def self.all
        @@all
    end

    attr_accessor :url

    def initialize(url)
        @url = url
        self.class.all << self
    end

    def get_response_body
        uri = URI.parse(self.url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        parsed = JSON.parse(self.get_response_body)
    end

end

# get = GetRequester.new("https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json").parse_json
# ap get