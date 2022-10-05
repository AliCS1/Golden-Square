require 'tasks.rb'

RSpec.describe 'checks tasks method' do
    context 'given a string containing #TODO' do
        it 'return True' do
            result = tasks('Driving to work #TODO')
            expect(result).to eq true
        end
    end
    context 'given a string not containing #TODO' do
        it 'returns False' do 
            result = tasks('Eating breakfast')
            expect(result).to eq false
        end
    end
    context 'given an empty string' do
        it 'return False' do
            result = tasks('')
            expect(result).to eq false
        end
    end
end