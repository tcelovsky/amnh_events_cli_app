class Event
attr_accessor :name, :type, :short_description, :date, :time, :tickets, :detailed_description
@@all = []

def initialize
  @@all << self
end

def self.all
  @@all
end

end
