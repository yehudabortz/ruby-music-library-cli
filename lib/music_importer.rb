require 'pry'
# path = "./spec/fixtures/mp3s"
class MusicImporter

    def initialize(path)
        @path = path
    end

    def path
        @path
    end

    def files
        Dir.glob("#{path}/*.mp3").map do |file|
        file.gsub("#{path}/", "")
        end
    end

    def import
        files.each {|file| Song.create_from_filename(file)}
    end

end