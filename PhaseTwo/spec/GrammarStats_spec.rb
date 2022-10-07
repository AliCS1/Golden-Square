require 'GrammarStats.rb'

RSpec.describe 'Testing GrammarStats class' do
    context 'testing check method' do
        it 'returns true' do
            g = GrammarStats.new()
            result = g.check('Chocolate is delicious!')
            expect(result).to eq true
        end
        it 'returns false' do
            g = GrammarStats.new()
            result = g.check('winter is here.')
            expect(result).to eq false
        end
        it 'returns false' do
            g = GrammarStats.new()
            result = g.check('Phone')
            expect(result).to eq false
        end
    end
    context 'check percentage_good' do
        it 'returns the correct amount of checks' do
            g = GrammarStats.new()
            g.check('Food!')
            g.check("Grammar!")
            g.check('winter')
            result = g.percentage_good
            expect(result).to eq 66
        end
        it 'does percentage_good with no checks' do
            g = GrammarStats.new()
            expect{g.percentage_good}.to raise_error 'Dividing by 0'
        end 
    end
end