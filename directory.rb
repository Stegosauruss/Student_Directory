# Method to add students to list
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end


# Method to print header
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Method to print student list
def print(names)
  names.each do |name|
    puts name
  end
end

# Method to print the number of students
def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

# Calling methods in order
students = input_students
print_header
print(students)
print_footer(students)