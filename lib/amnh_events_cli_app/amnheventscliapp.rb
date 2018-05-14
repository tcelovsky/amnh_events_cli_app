class AmnhEventsCliApp::Events
attr_accessor :event, :name, :type, :date, :short_description, :url_text, :url, :time, :location, :tickets, :detailed_description
@@all = []

def self.all
  @@all
end

def self.get_page
  @doc = Nokogiri::HTML(open("https://www.amnh.org/calendar?facetsearch=1"))
end

def self.get_events
  self.get_page.css(".mod.event")
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
  self.all
end

def self.sort_events
  self.make_events
  self.all.sort_by! {|event| event.type}
end

def self.make_types
  self.sort_events.uniq {|event| event.type}
end

def self.print_types
  self.make_types.each.with_index(1) do |event, i|
    puts "#{i}. #{event.type}"
  end
end

end
