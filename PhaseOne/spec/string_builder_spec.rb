require 'string_builder.rb'

RSpec.describe "Adds strings to the StringBuilder" do

    it 'Adds "Hello" and then "Bob' do
        s = StringBuilder.new()
        s.add("Hello")
        s.add(" Bob")
        result = s.output
        expect(result).to eq "Hello Bob"
    end
    it 'Checks length of string "Alphabet"' do
        s = StringBuilder.new()
        s.add("Alphabet")
        result = s.size
        expect(result).to eq 8
    end
end
