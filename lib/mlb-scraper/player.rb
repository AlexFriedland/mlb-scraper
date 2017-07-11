class MlbScraper::Player

  attr_accessor :name, :number, :bt, :height, :weight, :dob, :url

  @@all = []

  def initialize(name, number, bt, height, weight, dob, url)
    @name = name
    @number = number
    @bt = bt
    @height = height
    @weight = weight
    @dob = dob
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end
end
