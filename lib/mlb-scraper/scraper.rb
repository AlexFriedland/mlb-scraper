require 'pry'

class MlbScraper::Scraper

  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def self.get_page(url)
    Nokogiri::HTML(open(url))
  end

  def self.get_players(url)
    self.get_page(url).css("section.module")
  end


  def self.pitchers(url)
    self.get_players(url).each {|section|
      if section.css("h4").text == "Pitchers"
        players = section.css("tr")

        players.each {|player|
          name = player.css("td.dg-name_display_first_last a").text
          number = player.css("td.dg-jersey_number").text
          bt = player.css("td.dg-bats_throws").text
          height = player.css("td.dg-height").text
          weight = player.css("td.dg-weight").text
          dob = player.css("td.dg-date_of_birth").text
          url = 'http://m.mets.mlb.com' + player.css("td.dg-name_display_first_last a").to_s.match(/(?<=")(?:\\.|[^"\\])*(?=")/).to_s


          MlbScraper::Player.new(name, number, bt, height, weight, dob, url)
        }
      end
    }

  end




  def self.catchers(url)
    self.get_players(url).each {|section|
      if section.css("h4").text == "Catchers"
        players = section.css("tr")

        players.each {|player|
          name = player.css("td.dg-name_display_first_last a").text
          number = player.css("td.dg-jersey_number").text
          bt = player.css("td.dg-bats_throws").text
          height = player.css("td.dg-height").text
          weight = player.css("td.dg-weight").text
          dob = player.css("td.dg-date_of_birth").text
          url = 'http://m.mets.mlb.com' + player.css("td.dg-name_display_first_last a").to_s.match(/(?<=")(?:\\.|[^"\\])*(?=")/).to_s
          MlbScraper::Player.new(name, number, bt, height, weight, dob, url)
        }
      end
    }

  end

  def self.infield(url)
    self.get_players(url).each {|section|
      if section.css("h4").text == "Infield"
        players = section.css("tr")

        players.each {|player|
          name = player.css("td.dg-name_display_first_last a").text
          number = player.css("td.dg-jersey_number").text
          bt = player.css("td.dg-bats_throws").text
          height = player.css("td.dg-height").text
          weight = player.css("td.dg-weight").text
          dob = player.css("td.dg-date_of_birth").text
          url = 'http://m.mets.mlb.com' + player.css("td.dg-name_display_first_last a").to_s.match(/(?<=")(?:\\.|[^"\\])*(?=")/).to_s
          MlbScraper::Player.new(name, number, bt, height, weight, dob, url)

        }
      end
    }

  end

  def self.outfield(url)
    self.get_players(url).each {|section|
      if section.css("h4").text == "Outfield"
        players = section.css("tr")

        players.each {|player|
          name = player.css("td.dg-name_display_first_last a").text
          number = player.css("td.dg-jersey_number").text
          bt = player.css("td.dg-bats_throws").text
          height = player.css("td.dg-height").text
          weight = player.css("td.dg-weight").text
          dob = player.css("td.dg-date_of_birth").text
          url = 'http://m.mets.mlb.com' + player.css("td.dg-name_display_first_last a").to_s.match(/(?<=")(?:\\.|[^"\\])*(?=")/).to_s
          MlbScraper::Player.new(name, number, bt, height, weight, dob, url)

        }
      end
    }

  end

  def self.full_roster(url)
    pitchers(url)
    catchers(url)
    infield(url)
    outfield(url)
  end


end
