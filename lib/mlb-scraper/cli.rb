#CLI controller - user interaction. welcome, input etc.
require 'pry'

class MlbScraper::CLI

  #stub of our interface

  def call
    team?
    menu(team)
  end

  def team
    puts "Which team would you like to see player info for?"
    i = 1
    team_list = []
    team_url = []

    #iterate
  end

  def menu(team)

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

      list_players


    elsif input == "2"
      puts "CATCHERS OF THE NEW YORK METROPOLITANS:

      "

      MlbScraper::Scraper.catchers

      list_players

    elsif input == "3"
      puts "INFIELD OF THE NEW YORK METROPOLITANS:

      "
      MlbScraper::Scraper.infield

      list_players

    elsif input == "4"
      puts "OUTFIELD OF THE NEW YORK METROPOLITANS:

      "
      MlbScraper::Scraper.outfield

      list_players

    elsif input == "5"
      puts "FULL ROSTER OF THE NEW YORK METROPOLITANS

      "
      MlbScraper::Scraper.full_roster

      list_players


    elsif input == "exit"
      quit
    else
      puts "Sorry, I don't recognize that input."
      menu(team)
    end

    get_player_info?
  end


  def get_player_info?
    p "If you want to see more info on a player, enter their number and press ENTER.  Otherwise, if you want to go back, type 'back'.  Or, just type 'quit'"

    input = gets.strip
    arr = (0..100).to_a

    if input == "quit"
      quit
    elsif input == "back"
      menu(team)
    elsif arr.include?(input.to_i)
      MlbScraper::Player.all.each {|player|
        if player.number.to_i == input.to_i
          MlbScraper::Player.player_info(player.url)
          get_player_info?
        end
      }
    else
          p "I don't recognize that player's number!"
          get_player_info?
    end
  end


  def quit
    abort("See you soon!")
  end


  def list_players
    MlbScraper::Player.all.each {|player|
      puts "
      Name: #{player.name}
      Number: #{player.number}
      Batting / Throwing: #{player.bt}
      Height: #{player.height}
      Weight: #{player.weight}
      Birthday: #{player.dob}
      "
    }
  end




end
