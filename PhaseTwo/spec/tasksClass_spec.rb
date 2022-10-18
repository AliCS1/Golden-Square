require 'tasksClass.rb'

RSpec.describe 'checking tasks class' do
    context 'adding tasks to list' do
        it 'returns the previous tasks' do
            t = TasksClass.new()
            t.add('Buy groceries')
            t.add('Clean room')
            result = t.view
            expect(result).to eq 'Tasks todo: Buy groceries, Clean room'
        end
    end
    context 'marks tasks as complete and remove from list' do
        it 'given real task, removes it, checks list of tasks' do
            t = TasksClass.new()
            t.add('Buy groceries')
            t.add('Clean room')
            t.completed('Buy groceries')
            t.add('Clean dishes')
            result = t.view
            expect(result).to eq 'Tasks todo: Clean room, Clean dishes'
        end
    end
    
end
