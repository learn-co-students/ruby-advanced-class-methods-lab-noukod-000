class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    Song.new.save
    self.all.last
  end

def self.new_by_name(name)
  song = self.new
  song.name = name
  song.save
  return song
end

def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end


  def self.find_by_name(name)
      @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(name)
    title = name.split(" - ")
    artist = title[0]
    song_name, extension = title[1].split(".")
    song = self.new
    song.artist_name = artist
    song.name = song_name
    song
  end

  def self.create_from_filename(name)
    title = name.split(" - ")
    artist = title[0]
    song_name, extension = title[1].split(".")
    song = self.create
    song.artist_name = artist
    song.name = song_name
     song
  end

def self.destroy_all
  self.all.clear
end
end
