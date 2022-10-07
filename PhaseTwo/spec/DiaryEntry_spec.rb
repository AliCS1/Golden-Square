require 'DiaryEntry.rb'

RSpec.describe 'test DiaryEntry class' do
    context 'testing title method' do
        it 'returns the title' do
            d = DiaryEntry.new('Food','Chocolate is an unhealthy food')
            expect(d.title).to eq 'Food'
        end
    end
    context 'testing contents method' do
        it 'return the contents' do
            d = DiaryEntry.new('Food','Chocolate is an unhealthy food')
            expect(d.contents).to eq 'Chocolate is an unhealthy food'
        end
    end
    context 'test the count words method' do
        it 'returns the amount of words' do
            d = DiaryEntry.new('Food','Chocolate is an unhealthy food')
            expect(d.count_words).to eq 5
        end
    end
    context 'test reading_time' do
        it 'returns the correct time in minutes' do
        d = DiaryEntry.new('Food','Chocolate is an unhealthy food')
            expect(d.reading_time(10)).to eq 0.5
        end
    end
end