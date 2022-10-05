require 'counter.rb'

RSpec.describe 'Counts using classes' do
    it 'adds 5 then 8' do
        c = Counter.new()
        c.add(5)
        c.add(8)
        result = c.report()
        expect(result).to eq "Counted to 13 so far."
    end
    it 'adds 50 then 50' do
        c = Counter.new()
        c.add(50)
        c.add(50)
        result = c.report()
        expect(result).to eq 'Counted to 100 so far.'
    end
end
