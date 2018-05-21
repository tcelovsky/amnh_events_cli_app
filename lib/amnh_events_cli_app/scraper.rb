class AmnhEventsCliApp::Scraper

  # now that we've split this responsibility up, and we aren't referencing @@doc
  # anywhere else, we can really just get rid of this method entirely, and just
  # call Scraper.scrape in CLI#call to gather all information we need into the 
  # Event class...
  def self.get_page
    @@doc ||= scrape
  end

  def self.scrape
    Nokogiri::HTML(open("https://www.amnh.org/calendar?facetsearch=1"))
  end
end
