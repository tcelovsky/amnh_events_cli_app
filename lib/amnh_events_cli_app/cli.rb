class AmnhEventsCliApp::CLI

  def call
    puts "Welcome!"
    list_types
    menu
    goodbye
  end

  def print_types
    AmnhEventsCliApp::Events.make_types.each.with_index(1) do |event, i|
      puts "#{i}. #{event.type}"
    end
  end

  def list_types
    puts "Here are types of upcoming events at the American Museum of Natural History (AMNH):"
    @event_types = print_types
    puts "Enter the number corresponding to the type of event you'd like more information on or type 'exit':"
  end

  def list_events(type)
    @events = AmnhEventsCliApp::Events.sort_events.select {|event| event.type == type}
    @events.uniq {|event| event.name}
  end

  def menu
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      if input.to_i.between?(1, AmnhEventsCliApp::Events.make_types.length)
        type = @event_types[input.to_i - 1].type
        list_events(type).each do |event|
          puts "#{event.date} - #{event.name}:"
          puts "#{event.short_description}"
          puts "For additional information and to purchase tickets, go to https://www.amnh.org/#{event.url}"
          puts
        end
        puts "Type 'list' to see available types of events again or type 'exit':"
      elsif input == "list"
        list_types
        "Enter the number corresponding to the type of event you'd like more information on or type 'exit':"
      else puts "Type 'list' to see available types of events again or type 'exit':"
      end
    end
  end

  def goodbye
    puts "Come back soon!"
  end

end
