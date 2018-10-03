require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil,artist_name=nil)
    @name=name
    @artist_name=artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new(name)
  end

  def self.create_by_name(name)
    song = Song.new(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name==name}
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    if(found!=nil)
      found
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort {|song1,song2| song1.name <=> song2.name}
  end

  def self.new_from_filename(filename)
    filename=filename.split(/ - /)
    name_of_the_artist=filename[0]
    name_of_the_song=filename[1].sub(/.mp3/,'')
    song=Song.new(name_of_the_song,name_of_the_artist)
  end

  def self.create_from_filename(filename)
    filename=filename.split(/ - /)
    name_of_the_artist=filename[0]
    name_of_the_song=filename[1].sub(/.mp3/,'')
    song=Song.new(name_of_the_song,name_of_the_artist)
    @@all << song
  end

  def self.destroy_all
    @@all=[]
  end
end
