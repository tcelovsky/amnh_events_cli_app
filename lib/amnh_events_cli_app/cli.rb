class AmnhEventsCliApp::CLI
attr_accessor :events, :type

  def call
    puts "Welcome!"
    list_events
    menu
    goodbye
  end

  def events
    @events = AmnhEventsCliApp::Events.list
    @events.each.with_index(1) do |event, i|
      puts "#{i}. #{event.type}"
    end
  end

  def list_events
    puts "Here are types of upcoming events at the American Museum of Natural History (AMNH):"
    events
    puts
  end

  def menu
    input = nil
    puts "Enter the number corresponding to the type of event you'd like more information on or type 'exit':"
    puts
    while input != "exit"
      input = gets.strip.downcase
      if input.to_i > 0
        event = @events[input.to_i - 1]
        puts
          puts "#{event.name}:"
          puts "#{event.date} - #{event.time}"
          puts "#{event.short_description}"
          puts
          puts "For information about tickets type 'tickets'; for detailed description of event type 'description'. Type 'list' to see available types of events again or type 'exit':"
          puts
        elsif input == "tickets"
          puts
          puts "#{event.tickets}"
          puts
        elsif input == "description"
          puts
          puts "#{event.detailed_description}"
          puts
      elsif input == "list"
        list_events
      else puts "Type 'list' to see available types of events again or type 'exit':"
        puts
      end
    end
  end

  def goodbye
    puts "Come back soon!"
  end

end
