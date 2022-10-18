require 'net/http'
require 'json'

class ActivitySuggester
  def suggest
    response = make_request_to_api
    return "Why not: #{response["activity"]}"
  end

  private

  # This method calls an 'API' on the internet to get a random activity.
  # An API is a way of allowing programs to request data from other programs.
  def make_request_to_api
    text_response = Net::HTTP.get("www.boredapi.com", "/api/activity")
    return JSON.parse(text_response)
  end
end

require 'date'
require 'json'
require 'net/http'

class TimeError
    def initialize(requester,time1)
        @requester = requester
        @time1 = time1
    end
  # Returns difference in seconds between server time
  # and the time on this computer
  def error
    return get_server_time - @time1.now
  end
  private

  def get_server_time
    text_response = @requester.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end

require 'json'
require 'net/http'

class CatFacts
    def initialize(requester)
        @requester = requester
    end

  def provide
    return "Cat fact: #{get_cat_fact["fact"]}"
  end

  private

  def get_cat_fact
    text_response = @requester.get(URI("https://catfact.ninja/fact"))
    return JSON.parse(text_response)
  end
end
