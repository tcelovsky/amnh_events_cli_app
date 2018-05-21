class AmnhEventsCliApp::Events
  attr_accessor :event, :name, :type, :date, :short_description, :url_text, :url, :time, :location, :tickets, :detailed_description

  @@all = []

  def self.all
    @@all
  end

  # we could eliminate this method from the Event class and just call the
  # scrape method from the CLI#call method....
  def self.get_events
    AmnhEventsCliApp::Scraper.get_page.css(".mod.event")
  end

  def self.make_events
    self.get_events.each do |post|
      event = AmnhEventsCliApp::Events.new
      @@all << event
      event.type = post.css("p.category").text
      event.name = post.css("a").text.strip
      event.date = post.css("p.date").text
      text = post.css("p").text
      event.short_description = text.to_s.gsub(/#{event.date}/,"").gsub(/#{event.type}/,"").gsub(" Members Only","").gsub(" Sold Out","").gsub(" Free With Museum Admission","").gsub("â"," ")
      event.url = post.css("a").first["href"]
    end

    # we really don't need to return self.all here, since we already have a method to do that (.all)
    # then, anywhere we need to access all the Events we can just call Event.all
    self.all
  end

  def self.sort_events
    self.make_events
    self.all.sort_by! {|event| event.type}
  end

  def self.make_types
    self.sort_events.uniq {|event| event.type}
  end

end
