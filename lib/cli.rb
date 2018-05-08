class AmnhEventsCliApp::CLI

  def call
    puts "Welcome!"
    list_events
  end

  def list_events
    puts "Here are the types of upcoming events at the American Museum of Natural History (AMNH):"
    puts "1. Lectures"
    puts "2. Members Programs"
    puts "3. Courses and Workshops"
    puts "4. After Hours Programs"
  end


end
