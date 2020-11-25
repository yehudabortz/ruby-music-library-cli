require 'pry'
class Artist
    extend Concerns::Findable

    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        song = new(name)
        song.save
        song
    end

    #associatiions methods

    def add_song(song)
        if song.artist != self
        song.artist = self
        end
        if !@songs.include?(song)
            @songs << song
        end
    end

    def genres
        all_genres = []
        self.songs.each do |song|
            all_genres << song.genre
        end
        all_genres.uniq
    end

    
end