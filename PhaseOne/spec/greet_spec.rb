require 'greet.rb'

RSpec.describe 'greet_person' do
    it 'Greets person named Bob' do
        result = greet('Bob')

        expect(result).to eq "Hello, Bob!"
    end
end