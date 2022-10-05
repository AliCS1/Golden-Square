require 'report_length.rb'

RSpec.describe "Finds length of word" do
    it 'Finds length of "Cook"' do
        result = report_length("Cook")
        expect(result).to eq "This string was 4 characters long."
    end
    it 'Finds length of "Describe"' do
        result = report_length("Describe")
        expect(result).to eq "This string was 8 characters long."
    end
end