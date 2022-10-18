require 'music.rb'

RSpec.describe 'Checks music class' do
    context 'adding three different songs' do
        it 'returns list of songs' do
            s = Song.new()
            s.add('Song1')
            s.add('Song2')
            s.add('Song3')
            result = s.view()
            expect(result).to eq 'Song1, Song2, Song3'
        end
    end
    context 'asks for list without adding any' do
        it 'return error' do
            s = Song.new()
            expect{s.view()}.to raise_error 'No songs added yet.'
        end
    end
end