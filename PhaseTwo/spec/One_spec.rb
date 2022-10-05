require 'One.rb'

RSpec.describe 'tests reading_time method' do
    context 'given a string of 10 words' do
        it 'results seconds taken to read' do
            result = reading_time("October is a cool month since it's when Halloween is.")
            expect(result).to eq 33
        end
    end
    context 'given empty string' do
        it 'returns 0 seconds' do
            result = reading_time("")
            expect(result).to eq 0
        end
    end
    context 'given 1 word' do
        it 'returns 3 seconds' do
            result = reading_time("Bob")
            expect(result).to eq 3
        end
    end
end