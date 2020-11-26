require 'pry'
class MusicLibraryController

     def initialize(path = './db/mp3s')
        MusicImporter.new(path).import
     end

     def call
        input = ""

        while input != "exit"
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"

            input = gets.strip
        end

        def list_songs
            ordered_list = []
            Song.all.map do |song|
                ordered_list << song.name
            end
            numbered_list = ordered_list.sort.map do |song|
                i = 0
                song.insert(0, "#{i}. ")
                i += 1
            end
            numbered_list
           
        end
     end



end