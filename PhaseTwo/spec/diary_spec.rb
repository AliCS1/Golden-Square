require 'diary.rb'
require 'diary_entry.rb'

RSpec.describe 'Checks diary after a few entries' do
    context 'adds 2 entries to diary and views them' do
        it 'returns the title of 2 entries' do
            d = Diary.new()
            book1 = DiaryEntry.new('Game of Thrones', 'This is a book about dragons and kings!')
            book2 = DiaryEntry.new('Hunger Games','A battle between the ultra rich and the people living in poverty.')
            d.add(book1)
            d.add(book2)
            result = d.all
            expect(result).to eq 'Game of Thrones, Hunger Games'
        end
        it 'returns the number of words in all entries' do
            d = Diary.new()
            book1 = DiaryEntry.new('Game of Thrones', 'This is a book about dragons and kings!')
            book2 = DiaryEntry.new('Hunger Games','A battle between the ultra rich and the people living in poverty.')
            d.add(book1)
            d.add(book2)
            result = d.count_words
            expect(result).to eq 20
        end
        it 'returns correct reading_time' do
            d = Diary.new()
            book1 = DiaryEntry.new('Game of Thrones', 'This is a book about dragons and kings!')
            book2 = DiaryEntry.new('Hunger Games','A battle between the ultra rich and the people living in poverty.')
            d.add(book1)
            d.add(book2)
            result = d.reading_time(10)
            expect(result).to eq 2
        end
        it 'returns best entry' do
            d = Diary.new()
            book1 = DiaryEntry.new('Game of Thrones', 'This is a book about dragons and kings!')
            book2 = DiaryEntry.new('Hunger Games','A battle between the ultra rich and the people living in poverty.')
            d.add(book1)
            d.add(book2)
            result = d.find_best_entry_for_reading_time(10,3)
            expect(result).to eq 'You can read Hunger Games'
        end
    end
end
