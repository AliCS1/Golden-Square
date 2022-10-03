require 'check_codeword.rb'

RSpec.describe "Checks if codeword is correct" do
    it "checks if codeword is horse" do
        result = check_codeword("horse")
        expect(result).to eq "Correct! Come in."
    end
    it "See's if word is hope" do
        result = check_codeword("hope")
        expect(result).to eq "Close, but nope."
    end
    it "See's if word is wrong" do
        result = check_codeword("Car")
        expect(result).to eq "WRONG!"
    end

end