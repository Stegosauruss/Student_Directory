# Method to add students to list
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "and their hobbies?"
    hobby = gets.chomp
    puts "and their country of birth?"
    country = gets.chomp
    students << {name: name, cohort: :november, hobbies: hobby, birth_country: country}
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
def print_list(names, letter)
  count = 0
  while count < names.length  do
    if names[count][:name][0] == letter && names[count][:name].length < 12
      puts "#{count}. #{names[count][:name]}
      cohort: #{names[count][:cohort]}
      country of birth: #{names[count][:birth_country]}   
      hobbies: #{names[count][:hobbies]}"
    end
    count += 1
  end
end

# Method to print the number of students
def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

# Method to print full list
def print(names)
  puts "Which letter would you like to print?"
  current_letter = gets.chomp
  print_header
  print_list(names, current_letter)
  print_footer(names)
end

# Calling methods in order
students = input_students
print(students)