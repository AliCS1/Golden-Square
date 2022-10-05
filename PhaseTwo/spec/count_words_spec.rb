require 'count_words.rb'

RSpec.describe 'uses count_words method' do
    context 'inputs string into method' do
        it 'inputs empty string' do
            result = count_words('')
            expect(result).to eq 0
        end
        it 'inputs one word' do
            result = count_words('Chill')
            expect(result).to eq 1
        end
        it 'inputs three words' do
            result = count_words('Play the game')
            expect(result).to eq 3
        end
    end
end
