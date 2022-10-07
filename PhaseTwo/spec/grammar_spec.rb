require 'grammar.rb'

RSpec.describe 'checks grammar method' do
    context 'given no capital letter' do
        it 'returns need capital letter' do
            result = grammar('cat')
            expect(result).to eq 'Needs capital letter'
        end
    end
    context 'given no punctuation' do
        it 'returns Need punctuation mark' do
            result = grammar("Dog")
            expect(result).to eq 'Needs punctuation mark' 
        end
    end
    context 'given correct grammar' do
        it 'returns Perfect' do
            result = grammar("Wow!")
            expect(result).to eq 'Perfect'
        end
    end
end