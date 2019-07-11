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

# Prints student list
puts "The studets of Villains Academy"
puts "-------------"
students.each {|student| puts student}

# Printing the number of students
puts "Overall we have #{students.count} great students"