class AmnhEventsCliApp::Events
attr_accessor :name, :type, :date, :description

def self.list
  puts "Here are the types of upcoming events at the American Museum of Natural History (AMNH):"
  puts "1. LECTURES AND TALKS"
  puts "2. MEMBERS PROGRAMS"
  puts "3. COURSES AND WORKSHOPS"
  puts "4. AFTER HOURS PROGRAMS"
  puts "5. SPECIAL EVENTS"

  event_1 = self.new
  event_1.name = "Frontiers Lecture: Planetary Origin Stories"
  event_1.type = "LECTURES AND TALKS"
  event_1.date = "Monday, May 14, 2018"
  event_1.description = "By studying and compiling “snapshots” from nearby stars, Alycia Weinberger takes us on a journey back in time to the origins of planets."

end

end
