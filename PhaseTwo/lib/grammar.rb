#As a user
#So that I can improve my grammar
#I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

#Name: grammar
#Parameters: string
#Output: Tells user if it starts with capital, or needs a punctuation mark


def grammar(string)
    if string[0] != string[0].upcase
        return 'Needs capital letter'
    end
    if string[-1].scan(/[.!?]/).count > 0
        return 'Perfect'
    else
        return 'Needs punctuation mark'
    end
end

