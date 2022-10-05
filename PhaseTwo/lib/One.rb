#As a user
#So that I can manage my time
#I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.


#Name: reading_time
#Parameters: String of text
#Returns number of seconds it takes to read

# 200 words in 60 seconds
# one word in 3.33 seconds

#EXAMPLE
#Reading_time("October is a cool month since it's when Halloween is.") => 33.3 seconds

def reading_time(text)
    if text == ''
        return 0
    end
    words = text.count " "
    words += 1
    return (words * 3.33).to_i
end