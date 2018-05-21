# Glows

  - Very cool app!  Love the idea!  I've been there once but would be more interested to see these actual events

# Grows

  - DONE! Seems like we're scraping every single time we choose something from the menu.  Can we prevent this?
    - How often would the site change?  We would want to scrape every time if it's minute-by-minute but otherwise no need
  - Consider SRP, or Single Responsibility Principle:
    - What does it mean?  Each class/each method should have one job
    - How many jobs is the AmnhEventsCliApp class doing?  Could we break the jobs up?
  - It's great to break up helper methods, but do we need all the different sorting/making/printing methods? (Maybe we do...)

# Refactor opportunities

  1. DONE Prevent multiple scraping.  Once the page has been scraped, no need to scrape it again
  2. Break apart the scraping functionality into its own class
  3. Move all `puts` statements into the CLI class
  # don't worry about this 4. Consider consolidating/shrinking the number of methods you're using to organize data︀
