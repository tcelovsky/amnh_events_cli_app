class AmnhEventsCliApp::CLI

  def call
    puts "Welcome!"
    list_events
    menu
    goodbye
  end

  def list_events
    puts "Here are the types of upcoming events at the American Museum of Natural History (AMNH):"
    puts "1. Lectures"
    puts "2. Members Programs"
    puts "3. Courses and Workshops"
    puts "4. After Hours Programs"
    @events = AmnhEventsCliApp::Events.list
  end

  def menu
    input = nil
    puts "Enter the number of the event you'd like more information on, type 'list' to see the list of events again or type 'exit':"
    while input != "exit"
    input = gets.strip.downcase
    case input
    when "1"
      puts "More information on event 1..."
    when "2"
      puts "More information on event 2..."
    when "3"
      puts "More information on event 3..."
    when "4"
      puts "More information on event 4..."
    when "list"
      list_events
    else puts "Type 'list' to see list of events again or type 'exit':"
    end
    end
  end

  def goodbye
    puts "Come back soon!"
  end

end
