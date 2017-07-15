#environment file that loads dependencies

module MlbScraper

end

require 'nokogiri'
require 'open-uri'
require 'pry'



require_relative "./mlb-scraper/cli"
require_relative "./mlb-scraper/player"
require_relative "./mlb-scraper/position"
require_relative "./mlb-scraper/scraper"
require_relative "./mlb-scraper/version"
require_relative "./mlb-scraper/team"
