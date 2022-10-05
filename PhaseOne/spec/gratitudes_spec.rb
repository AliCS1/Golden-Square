require 'gratitudes.rb'

RSpec.describe "checks gratitude class" do
    it 'adds "Parents" and "Teachers"' do
        g = Gratitudes.new()
        g.add("Parents")
        g.add("Teachers")
        result = g.format
        expect(result).to eq "Be grateful for: Parents, Teachers"
    end
    it 'adds "Makers" to the list' do
        g = Gratitudes.new()
        g.add("Makers")
        result = g.format
        expect(result).to eq "Be grateful for: Makers"
    end
end
