class Artist


    @@all = []
    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|each_song| each_song.artist == self }
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
      artist = self.all.find {|artist| artist.name == name}  
      if artist == nil
        artist = self.new(name)
        artist
    else
        artist
    end
    end

    def print_songs
       self.songs.each {|song| puts song.name }
    end



end