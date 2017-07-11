#CLI controller - user interaction. welcome, input etc.
require 'pry'

class MlbScraper::CLI

  #stub of our interface

  def call
    menu
  end

  def menu

    puts "Welcome to the player roster of the New York Metropolitans.

    Which position would you like to view?

    1. Pitchers
    2. Catchers
    3. Infield
    4. Outfield
    5. Full Roster

    Type 'exit' to quit"


    input = gets.strip


    if input == "1"
      puts "PITCHERS OF THE NEW YORK METROPOLITANS

      "
      MlbScraper::Scraper.pitchers

      MlbScraper::Player.all.each {|player|
        puts "

        Name: #{player.name}
        Number: #{player.number}
        Batting / Throwing: #{player.bt}
        Height: #{player.height}
        Weight: #{player.weight}
        Birthday: #{player.dob}"

      }


    elsif input == "2"
      puts "CATCHERS OF THE NEW YORK METROPOLITANS:

      "

      MlbScraper::Scraper.catchers

      MlbScraper::Player.all.each {|player|
        puts "

        Name: #{player.name}
        Number: #{player.number}
        Batting / Throwing: #{player.bt}
        Height: #{player.height}
        Weight: #{player.weight}
        Birthday: #{player.dob}"
      }

    elsif input == "3"
      puts "INFIELD OF THE NEW YORK METROPOLITANS:

      "
      MlbScraper::Scraper.infield

      MlbScraper::Player.all.each {|player|
        puts "

        Name: #{player.name}
        Number: #{player.number}
        Batting / Throwing: #{player.bt}
        Height: #{player.height}
        Weight: #{player.weight}
        Birthday: #{player.dob}"
      }

    elsif input == "4"
      puts "OUTFIELD OF THE NEW YORK METROPOLITANS:

      "
      MlbScraper::Scraper.outfield

      MlbScraper::Player.all.each {|player|
        puts "

        Name: #{player.name}
        Number: #{player.number}
        Batting / Throwing: #{player.bt}
        Height: #{player.height}
        Weight: #{player.weight}
        Birthday: #{player.dob}"
      }

    elsif input == "5"
      puts "FULL ROSTER OF THE NEW YORK METROPOLITANS

      "
      MlbScraper::Scraper.full_roster

      MlbScraper::Player.all.each {|player|
        puts "

        Name: #{player.name}
        Number: #{player.number}
        Batting / Throwing: #{player.bt}
        Height: #{player.height}
        Weight: #{player.weight}
        Birthday: #{player.dob}"
      }


    elsif input == "exit"
      quit
    else
      puts "Sorry, I don't recognize that input."
      menu
    end

    get_player_info?
  end

  def get_player_info?
    p "If you want to see more info on a player, enter their number and press ENTER.  Otherwise, if you want to go back, type 'back'.  Or, just type 'quit'"

    input = gets.chomp

    if input == "quit"
      quit
    elsif input == "back"
        menu
    elsif input == x #player number
      #find player by number
      #drill down
    else
          p "I don't recognize that player's number!"
          get_player_info?
    end
  end


  def quit
    abort("See you soon!")
  end




end
