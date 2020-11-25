require 'pry'
class Song
    attr_accessor :name, :artist, :genre
    # attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        if artist
            self.artist = artist
        end
        if genre
            self.genre = genre
        end
        # save
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

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        if !@genre.songs.include?(self)
            @genre.songs << self
        end
    end

    def self.find_by_name(name)
        @@all.find {|song| song.name == name }
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(file_name)
        artist_name = file_name.split(" - ").first
        song_name = file_name.split(" - ")[1]
        genre_name = file_name.split(" - ")[2].split(".")[0]

        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)

        new(song_name, artist, genre)
    end

    def self.create_from_filename(file_name)
        new_from_filename(file_name).save
    end

end