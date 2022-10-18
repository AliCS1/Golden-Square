require '05_unit_testing.rb'

RSpec.describe 'testing interactive_calculator' do
    it 'gives result' do
        io = double(:io)

        expect(io).to receive(:puts).with("Hello. I will subtract two numbers.")
        expect(io).to receive(:puts).with("Please enter a number")
        expect(io).to receive(:gets).and_return("5")
        expect(io).to receive(:puts).with("Please enter another number")
        expect(io).to receive(:gets).and_return("3")
        expect(io).to receive(:puts).with("Here is your result:")
        expect(io).to receive(:puts).with("5 - 3 = 2")
        


        i = InteractiveCalculator.new(io)
        i.run

    end
end 

RSpec.describe 'testing StringRepeater class' do
    it 'returns correct result' do
        io = double(:io)

        expect(io).to receive(:puts).with("Hello. I will repeat a string many times.")
        expect(io).to receive(:puts).with("Please enter a string")
        expect(io).to receive(:gets).and_return("TWIX")
        expect(io).to receive(:puts).with("Please enter a number of repeats")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Here is your result:")
        expect(io).to receive(:puts).with("TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX")

        s = StringRepeater.new(io)
        s.run
    end


end