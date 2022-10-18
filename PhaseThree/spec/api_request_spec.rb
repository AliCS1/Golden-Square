require '04_api_request.rb'


RSpec.describe 'Testing TimeError' do
    it 'returns the error method' do
        requester = double :request
        time1 = double :Time
        expect(requester).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return("{\"abbreviation\":\"BST\",\"client_ip\":\"147.148.78.156\",\"datetime\":\"2022-10-18T12:46:01.479698+01:00\",\"day_of_week\":2,\"day_of_year\":291,\"dst\":true,\"dst_from\":\"2022-03-27T01:00:00+00:00\",\"dst_offset\":3600,\"dst_until\":\"2022-10-30T01:00:00+00:00\",\"raw_offset\":0,\"timezone\":\"Europe/London\",\"unixtime\":1666093561,\"utc_datetime\":\"2022-10-18T11:46:01.479698+00:00\",\"utc_offset\":\"+01:00\",\"week_number\":42}")
        expect(time1).to receive(:now).and_return(Time.new(2022,10,18,12,55,27,"+01:00"))
        t = TimeError.new(requester,time1)
        result = t.error
        expect(result).to eq -565.520302
    end
end

RSpec.describe 'testing CatFacts' do
    it 'returns a cat fact' do
        request = double(:requester)
        expect(request).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return("{\"fact\":\"In the 1930s, two Russian biologists discovered that color change in Siamese kittens depend on their body temperature. Siamese cats carry albino genes that work only when the body temperature is above 98\\u00b0 F. If these kittens are left in a very warm room, their points won\\u2019t darken and they will stay a creamy white.\",\"length\":315}")
        c = CatFacts.new(request)
        result = c.provide
        expect(result).to eq "Cat fact: In the 1930s, two Russian biologists discovered that color change in Siamese kittens depend on their body temperature. Siamese cats carry albino genes that work only when the body temperature is above 98° F. If these kittens are left in a very warm room, their points won’t darken and they will stay a creamy white."

    end
end