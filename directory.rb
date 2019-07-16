#Method to get cohort
def get_cohort
  cohorts = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  while true
    puts "What is their cohort?"
    cohort = gets.chomp
    if cohort == ""
      cohort = :november
      break
    elsif cohorts.include?(cohort)
      cohort = cohort.to_sym
      break
    else
      puts "Please try that again"
    end
  end
  cohort
end


# Method to add students to list
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    cohort = get_cohort
    puts "and their hobbies?"
    hobby = gets.chomp.to_sym
    puts "and their country of birth?"
    country = gets.chomp.to_sym
    students << {name: name, cohort: cohort, hobbies: hobby, birth_country: country}
    if students.length == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
    name = gets.chomp
  end
  students
end


# Method to print header
def print_header
  puts "The students of Villains Academy".center(30, "-")
  puts "-".center(30, "-")
end

# Method to print student list
def print_list(names, letter)
  count = 0
  months = {:january => 1, :february => 2, :march => 3, :april => 4, :may => 5, :june => 6, :july => 7, :august => 8, :september => 9, :october => 10, :november => 11, :december => 12}
  names = names.sort_by {|student| months[student[:cohort]]}
  puts names
  while count < names.length  do
    if names[count][:name][0] == letter && names[count][:name].length < 12
      puts "#{count+1}. #{names[count][:name]}".center(30, "-")
      puts "cohort: #{names[count][:cohort]}".center(30, "-")
      puts "country of birth: #{names[count][:birth_country]}".center(30, "-")   
      puts "hobbies: #{names[count][:hobbies]}".center(30, "-")
      puts "-".center(30, "-")
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