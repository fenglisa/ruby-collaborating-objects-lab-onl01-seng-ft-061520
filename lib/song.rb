require "pry"

class Song
  attr_accessor :name, :artist
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def save
    @@all << self
  end
 
  def self.all
    @@all
  end
  
  def self.new_by_filename(filename)
    file = filename.split(".")
    file.pop
    file = file.join.split("-").join.split("  ")
   
    artist_name = file[0]
    song_name = file[1]
    genre = file[2]
    
    song = self.new(song_name)
    artist = Artist.new(artist_name)
    song.artist = artist
    song
  end
  
  def artist_name=(artist_name)
    artist_name = Artist.find_or_create_by_name(artist_name)
    artist_name.add_song(self)
    
  end
  
end