class GrammarStats
    def initialize
      @checks_correct = 0
      @checks_total = 0
    end
  
    def check(text)
        @checks_total += 1.0
        if text[0] != text[0].upcase
            return false
        end
        if text[-1].scan(/[.?!]/).count > 0
            @checks_correct += 1.0
            return true
        else
            return false
        end
    end
  
    def percentage_good
      fail 'Dividing by 0' if @checks_total == 0
      return (100*(@checks_correct/@checks_total)).to_i
      # Returns as an integer the percentage of texts checked so far that passed
      # the check defined in the `check` method. The number 55 represents 55%.
    end
  end