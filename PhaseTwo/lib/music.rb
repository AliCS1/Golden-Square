#As a user
#So that I can keep track of my music listening
#I want to add tracks I've listened to and see a list of them.

class Song
    def initialize
        @ListOfSongs = []
    end
    def add(str)
        @ListOfSongs.push(str)
    end
    def view
        fail 'No songs added yet.' if @ListOfSongs.length == 0
        return @ListOfSongs.join(', ')
    end
end