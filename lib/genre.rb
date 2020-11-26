require 'pry'
class Genre
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

    def artists
        all_artists = []
        self.songs.each do |song|
            all_artists << song.artist
        end
        all_artists.uniq
    end


    # binding.pry
end