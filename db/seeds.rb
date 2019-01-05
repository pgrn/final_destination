# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# GLOBAL OBJECTS

# SAMPLE THINGS

# Sample users
u = User.create(
  username: "tester",
  name: "Tester T.",
  location: "Test City",
  email: "test@example.com", 
  password: "testtesttest"
)

u2 = User.create(
  username: "tfriend",
  name: "Nakamura T.",
  location: "Test City",
  email: "tfriend@example.com",
  password: "testtesttest"
)

# Sample user's space
u.spaces << Space.new(
  name: "test space",
  description: "you test stuff here",
  location: "Test City"
)

# The space's usual washing machine program
u.spaces.first.washing_machine_programs << WashingMachineProgram.new(
  name: "Speed Cycle 1",
  temp: 40,
  temp_unit: "celsius",
  speed: 30,
  description: "our usual cycle"
)

# The space's calendars
u.spaces.first.calendars << Calendar.new(
  name: "whatever goes",
  description: "all types of events",
  calendar_type: "whatever"
)

u.spaces.first.calendars << Calendar.new(
  name: "cleaning",
  description: "let's be tidy",
  calendar_type: "cleaning"
)

# The first calendar's calendar entries
u.spaces.first.calendars.first.calendar_entries << CalendarEntry.new(
  name: "clean the room",
  location: "Room 1",
  time: DateTime.now
)

u.spaces.first.calendars.first.calendar_entries << CalendarEntry.new(
  name: "clean another room",
  location: "Room 2",
  time: DateTime.now,
  owner: u2 # so that there's at least one event owned by someone
)

u.spaces.first.calendars.first.calendar_entries << CalendarEntry.new(
  name: "gather and party",
  location: "Room 2",
  time: DateTime.now
)

u.spaces.first.calendars.first.calendar_entries << CalendarEntry.new(
  name: "washing white clothes",
  location: "Room 1",
  time: DateTime.now
)

# making the user participate in all events 
u.calendar_entries << u.spaces.first.calendars.first.calendar_entries 

# Creating space rulesets...
u.spaces.first.rulesets << Ruleset.new(
  name: "cleaning rules",
  description: "how to clean appropriately"
)

u.spaces.first.rulesets << Ruleset.new(
  name: "drinking rules",
  description: "as it says on the tin"
)

# ...and the subsequent rules
u.spaces.first.rulesets.find(1).rules<< Rule.new(
  name: "clean the dishes",
  description: "use the yellow sponge"
)

u.spaces.first.rulesets.find(2).rules << Rule.new(
  name: "no excessive drinking",
  description: "we're being civil here"
)

# Creating space's saved places
u.spaces.first.saved_places << SavedPlace.new(
  name: "Ye Olde Bakery",
  description: "Get the best bread here!",
  owner: u
)
