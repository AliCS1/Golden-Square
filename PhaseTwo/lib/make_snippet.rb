def make_snippet(word)
    words = word.split " "
    if words.length < 4
        return word
    else
        ans = ""
        for i in 0..4
            ans += words[i]
            ans += " "
        end
        ans[-1] = '.'
        ans += ".."
        return ans
    end
end
