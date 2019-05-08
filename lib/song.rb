class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def initialize(name=nil,artist_name=nil)
    @name=name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def  self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    self.all.find{|s| s.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name)||self.create_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end
  
  def self.new_from_filename(song_name)
    parts = song_name.split(" - ")
    artist_name = parts[0]
    music_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = music_name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(song_name)
    parts = song_name.split(" - ")
    artist_name = parts[0]
    music_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = music_name
    song.artist_name = artist_name
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
