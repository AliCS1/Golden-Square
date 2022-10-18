require 'diary.rb'
require 'diaryEntry.rb'
require 'task.rb'
#As a user
#So that I can record my experiences
#I want to keep a regular diary
RSpec.describe 'Record entries into diary' do
    it 'returns entry of first diary' do
        diary = Diary.new
        entry_1 = DiaryEntry.new("Title of my diary", "Contents, in the diary are here")
        diary.add(entry_1)
        result = diary.entries
        expect(result).to eq [entry_1]
    end
    it 'returns error message if there are no entries' do
        FirstDiary = Diary.new
        expect{FirstDiary.entries}.to raise_error 'There are no entries'
    end
    it 'returns all entries' do
        FirstDiary = Diary.new
        entry_1 = DiaryEntry.new("Day 1","It was a good day")
        entry_2 = DiaryEntry.new("Day 2","Watched a movie")
        entry_3 = DiaryEntry.new("Day 3","Saw a cat")
        FirstDiary.add(entry_1)
        FirstDiary.add(entry_2)
        FirstDiary.add(entry_3)
        result = FirstDiary.entries
        expect(result).to eq [entry_1,entry_2,entry_3]
    end
end

#As a user
#So that I can reflect on my experiences
#I want to read my past diary entries
RSpec.describe 'Reading past entries' do
    it 'returns content of second entry' do
        FirstDiary = Diary.new
        entry_1 = DiaryEntry.new("Day 1","It was a good day")
        entry_2 = DiaryEntry.new("Day 2","Watched a movie")
        entry_3 = DiaryEntry.new("Day 3","Saw a cat")
        FirstDiary.add(entry_1)
        FirstDiary.add(entry_2)
        FirstDiary.add(entry_3)
        result = FirstDiary.content(1)
        expect(result).to eq 'Watched a movie'
    end
    it 'returns content of second entry' do
        FirstDiary = Diary.new
        entry_1 = DiaryEntry.new("Day 1","It was a good day")
        entry_2 = DiaryEntry.new("Day 2","Watched a movie")
        entry_3 = DiaryEntry.new("Day 3","Saw a cat")
        FirstDiary.add(entry_1)
        FirstDiary.add(entry_2)
        FirstDiary.add(entry_3)
        result = FirstDiary.allContents
        expect(result).to eq ['It was a good day',"Watched a movie", 'Saw a cat']
    end

    it 'returns correct word count' do
        entry_2 = DiaryEntry.new("Day 2","Watched a movie called Spiderman Far from Home. It was brilliant.")
        result = entry_2.word_count
        expect(result).to eq 11

    end

end


#As a user
#So that I can reflect on my experiences in my busy day
#I want to select diary entries to read based on how much time I have and my reading speed
RSpec.describe 'Chooses specific entry ' do
    it 'returns correct entry' do
        FirstDiary = Diary.new
        entry_1 = DiaryEntry.new("Day 1","It was a good day. Went fishing with my friends.")
        entry_2 = DiaryEntry.new("Day 2","Watched a movie called Spiderman Far from Home. It was brilliant.")
        entry_3 = DiaryEntry.new("Day 3","Saw a cat on the street, it looked friendly but it ran away quickly.")
        FirstDiary.add(entry_1)
        FirstDiary.add(entry_2)
        FirstDiary.add(entry_3)
        result = FirstDiary.ChooseDiary(10,60)
        expect(result).to eq entry_1
    end
    it 'raises error that no entry can be read' do
        FirstDiary = Diary.new
        entry_1 = DiaryEntry.new("Day 1","It was a good day. Went fishing with my friends.")
        entry_2 = DiaryEntry.new("Day 2","Watched a movie called Spiderman Far from Home. It was brilliant.")
        entry_3 = DiaryEntry.new("Day 3","Saw a cat on the street, it looked friendly but it ran away quickly.")
        FirstDiary.add(entry_1)
        FirstDiary.add(entry_2)
        FirstDiary.add(entry_3)
        expect{FirstDiary.ChooseDiary(5,60)}.to raise_error "You cannot read any entry in that time."
    end
    it 'raises error that there are no entries in the diary' do
        FirstDiary = Diary.new
        expect{FirstDiary.ChooseDiary(10,30)}.to raise_error "There are no entries in the diary"
    end

end

#As a user
#So that I can keep track of my tasks
#I want to keep a todo list along with my diary
RSpec.describe 'testing Task class' do
    it 'returns that the task incomplete' do
        test_1 = Task.new("Do the dishes")
        result = test_1.complete?
        expect(result).to eq false
    end
    it 'returns the task is complete' do
        t = Task.new("Do the dishes")
        t.completed
        result = t.complete?
        expect(result).to eq true
    end
    it 'returns the task' do
        t = Task.new("Do the dishes")
        result = t.task
        expect(result).to eq "Do the dishes"
    end
end

RSpec.describe 'testing to_do_list method' do
    context 'checking the correct result' do
        it 'returns the three tasks' do
            d1 = Diary.new()
            task_1 = Task.new("Read a book")
            task_2 = Task.new("Help a charity")
            task_3 = Task.new("Do the laundry")
            d1.add_task(task_1)
            d1.add_task(task_2)
            d1.add_task(task_3)
            result = d1.to_do_list
            expect(result).to eq [task_1,task_2,task_3]
        end
        it 'raises fail error since there is no task appended' do
            d1 = Diary.new()
            expect{d1.to_do_list}.to raise_error "There are no tasks in the list"
        end
    end
end

#As a user
#So that I can keep track of my contacts
#I want to see a list of all of the mobile phone numbers in all my diary entries

RSpec.describe 'Tests DiaryEntry for phone numbers' do
    it 'returns the phone number in a list' do
        entry_1 = DiaryEntry.new("Day 3","Saw a cat on the street, it looked friendly but it ran away quickly.")
        entry_1.add_phone_number('07306365530')
        result = entry_1.get_phone_numbers
        expect(result).to eq ['07306365530']
    end
    it 'raises error if there are no phone numbers added' do
        entry_1 = DiaryEntry.new("Day 3","Saw a cat on the street, it looked friendly but it ran away quickly.")
        expect{entry_1.get_phone_numbers}.to raise_error "No phone numbers added"
    end
end