require 'todo.rb'
require 'todo_list.rb'

RSpec.describe 'Checking todo class' do
    context 'create a task' do
        it 'returns the task content' do
            t = Todo.new('Clean room')
            result = t.task
            expect(result).to eq 'Clean room'
        end
        it 'marks task as done and returns true' do
            t = Todo.new('Clean room')
            t.mark_done!
            result = t.done?
            expect(result).to eq true
        end
        it 'checks if task done, returns false' do
            t = Todo.new('Clean room')
            result = t.done?
            expect(result).to eq false
        end
    end
    context 'checking TodoList' do
        it 'checks incomplete tasks' do
            t = TodoList.new()
            t.add(Todo.new('Wash the dishes'))
            t.add(Todo.new('Clean the room'))
            t.add(Todo.new('Buy food'))
            result = t.incomplete
            expect(result).to eq 'Wash the dishes, Clean the room, Buy food'
        end
        it 'completes one tasks, checks incomplete' do
            t = TodoList.new()
            t.add(Todo.new('Wash the dishes'))
            t.add(Todo.new('Clean the room'))
            t.add(Todo.new('Buy food'))
            t.complete_task('Wash the dishes')
            result = t.incomplete
            expect(result).to eq 'Clean the room, Buy food'
        end
        it 'gives up, checks incomplete' do
            t = TodoList.new()
            t.add(Todo.new('Wash the dishes'))
            t.add(Todo.new('Clean the room'))
            t.add(Todo.new('Buy food'))
            t.give_up!
            result = t.incomplete
            expect(result).to eq ''
        end
        it 'gives up, checks complete' do
            t = TodoList.new()
            t.add(Todo.new('Wash the dishes'))
            t.add(Todo.new('Clean the room'))
            t.add(Todo.new('Buy food'))
            t.give_up!
            result = t.complete
            expect(result).to eq 'Wash the dishes, Clean the room, Buy food'

        end

    end
end