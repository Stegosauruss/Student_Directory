# Array for students
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of he West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

# Method to print header
def print_header
  puts "The studets of Villains Academy"
  puts "-------------"
end

# Method to print student list
def print(names)
  names.each {|name| puts name}
end

# Method to print the number of students
def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

# Calling methods in order
print_header
print(students)
print_footer(students)