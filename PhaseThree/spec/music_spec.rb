require 'music_library.rb'
require 'track.rb'

RSpec.describe 'tests music library' do
    it 'returns all the libraries' do
        music = MusicLibrary.new()
        a = double(:fake_entry, matches?: true)
        music.add(a)
        result = music.all
        expect(result).to eq [a]
    end
    it 'searches for keyword' do
        music = MusicLibrary.new()
        a = double(:fake_entry, matches?: true)
        b = double(:fake_entry, matches?: false)
        c = double(:fake_entry, matches?: true)
        music.add(a)
        music.add(b)
        music.add(c)
        result = music.search('test')
        expect(result).to eq [a,c]
    end
end

RSpec.describe 'test Track class' do
    it 'checks matches function' do
        a = Track.new('Song1','Artistname')
        result = a.matches?("Song1")
        expect(result).to eq true
    end
end