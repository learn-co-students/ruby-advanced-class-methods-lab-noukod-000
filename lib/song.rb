class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    this = self.new
    this.save
    this
  end

  def self.new_by_name(name = "")
    this = self.new
    this.name =  name
    this
  end

  def self.create_by_name(name = "")
    this = self.create
    this.name = name
    this
  end

  def self.find_by_name(name = "")
    this = self.all.find{|s| s.name == name}
  end

  def self.find_or_create_by_name(name = "")
    this = self.new
    if (this = self.find_by_name(name)).nil?
      this = self.create_by_name(name)
    end
    this
  end

  def self.alphabetical
    self.all.sort{|s1, s2| s1.name <=> s2.name}
  end

  def self.new_from_filename(filename = "")
    this = self.new
    this.artist_name = filename.split(" - ").first
    this.name = filename.split(" - ").last.split(".").first
    this
  end

  def self.create_from_filename(filename = "")
    this = self.create
    this.artist_name = filename.split(" - ").first
    this.name = filename.split(" - ").last.split(".").first
    this
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
