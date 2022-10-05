require 'make_snippet.rb'

RSpec.describe 'make_snippet method' do
    context 'given empty string' do
        it 'returns the string' do
            result = make_snippet("")
            expect(result).to eq ''
        end
    end
    context 'given one word' do
        it 'returns that word' do
            result = make_snippet("Cooking")
            expect(result).to eq 'Cooking'
        end
    end
    context 'given 6 words' do
        it 'returns the first five words then "..."' do
            result = make_snippet("I enjoy playing the playstation alot")
            expect(result).to eq 'I enjoy playing the playstation...'
        end
    end
end