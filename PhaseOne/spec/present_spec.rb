require 'present.rb'

RSpec.describe Present do
    context 'when no task is set' do
        it 'checks wrap' do
            p = Present.new()
            p.wrap("try")
            expect { p.wrap("AAA") }.to raise_error "A contents has already been wrapped."
        end
        it 'fails unwrap' do
            p = Present.new()
            expect { p.unwrap }.to raise_error "No contents have been wrapped."
        end
    end
end