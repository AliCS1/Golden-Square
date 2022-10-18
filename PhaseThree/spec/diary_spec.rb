require 'secret_diary.rb'
require 'diary.rb'

RSpec.describe 'testing diary' do
    it 'reads diary content' do
        d = Diary.new('ABC')
        result = d.read
        expect(result).to eq 'ABC'
    end
end

RSpec.describe 'testing SecretDiary' do
    it 'unlocks diary, then tries to read it' do
        s = SecretDiary.new(double(:diary, read: 'ABC'))
        s.unlock
        result = s.read
        expect(result).to eq 'ABC'
    end
    it 'LOCKS diary, then tries to read it' do
        s = SecretDiary.new(double(:diary, read: 'ABC'))
        s.lock
        result = s.read
        expect(result).to eq 'Go away!'
    end

end

RSpec.describe 'testing task formatter' do 
    it 'checks if task is complete' do
        a = double(:t, complete: true, title: "ABC")
        t = TaskFormatter.new(a)
        result = t.format
        expect(result).to eq ["ABC"]
    end
end