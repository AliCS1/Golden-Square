class MusicLibrary
    def initialize
      @music = []
    end
  
    def add(track)
        @music << track # track is an instance of Track
      # Track gets added to the library
      # Returns nothing
    end
  
    def all
        return @music
      # Returns a list of track objects
    end
    
    def search(keyword)
        a = []
        @music.each {|track| 
            if track.matches?(keyword)
                a << track

            end

        } # keyword is a string
      # Returns a list of tracks that match the keyword
      return a
    end
  end