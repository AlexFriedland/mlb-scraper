class MlbScraper::Team

  attr_accessor :name, :number, :url

  @@all = []

  def initialize(name, number, url)
    @name = name
    @number = number
    @url = url

    @@all << self
  end

  def self.all
    @@all
  end
end
