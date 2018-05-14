class AmnhEventsCliApp::CLI
attr_accessor :events

  def call
    puts "Welcome!"
    list_events
    menu
    goodbye
  end

  def event_types
    @event_types = AmnhEventsCliApp::Events.print_types
  end

  def list_events
    puts "Here are types of upcoming events at the American Museum of Natural History (AMNH):"
    event_types
    puts "Enter the number corresponding to the type of event you'd like more information on or type 'exit':"
  end

  def menu
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      if input.to_i.between?(1, AmnhEventsCliApp::Events.make_types.length)
        event = @event_types[input.to_i - 1]
        # binding.pry
          puts "#{event.name}:"
          puts "#{event.date}"
          puts "#{event.short_description}"
          puts "For additional information and to purchase tickets, go to https://www.amnh.org/#{event.url}"
          puts "Type 'list' to see available types of events again or type 'exit':"
      elsif input == "list"
        list_events
        "Enter the number corresponding to the type of event you'd like more information on or type 'exit':"
      else puts "Type 'list' to see available types of events again or type 'exit':"
      end
    end
  end

  def goodbye
    puts "Come back soon!"
  end

end
