class AmnhEventsCliApp::CLI
attr_accessor :events

  def call
    puts "Welcome!"
    list_events
    menu
    goodbye
  end

  def events
    @events = AmnhEventsCliApp::Events.list
  end

  def list_events
    events.each.with_index(1) do |event, i|
      puts "#{i}. #{event.type}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the event you'd like more information on, type 'list' to see the list of events again or type 'exit':"
      input = gets.strip.downcase
      if input.to_i > 0
        puts @events[input.to_i - 1]
      elsif input == "list"
        list_events
      else puts "Type 'list' to see list of events again or type 'exit':"
      end
    end
  end

  def goodbye
    puts "Come back soon!"
  end

end
