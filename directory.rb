#Method to get cohort
def get_cohort
  months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  while true
    puts "What is their cohort?"
    cohort = gets.chomp
    if cohort == ""
      cohort = :november
      break
    elsif months.include?(cohort)
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
  name = gets.chop
  while !name.empty? do
    cohort = get_cohort
    puts "and their hobbies?"
    hobby = gets.chop.to_sym
    puts "and their country of birth?"
    country = gets.chop.to_sym
    students << {name: name, cohort: cohort, hobbies: hobby, birth_country: country}
    if students.length == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
    name = gets.chop
  end
  students
end


# Method to print header
def print_header
  puts "The students of Villains Academy".center(30, "-")
  puts "-".center(30, "-")
end

# Method to print student list
def print_list(students, letter)
  # Organise array by cohort and select only preferred letter 
  months = {:january => 1, :february => 2, :march => 3, :april => 4, :may => 5, :june => 6, :july => 7, :august => 8, :september => 9, :october => 10, :november => 11, :december => 12}
  students = students.sort_by {|student| months[student[:cohort]]}
  students = students.select do |student|
    student[:name][0] == letter && student[:name].length < 12
  end

  # print list
  count = 0
  while count < students.length  do
    puts "#{count+1}. #{students[count][:name]}".center(30, "-")
    puts "cohort: #{students[count][:cohort]}".center(30, "-")
    puts "country of birth: #{students[count][:birth_country]}".center(30, "-")   
    puts "hobbies: #{students[count][:hobbies]}".center(30, "-")
    puts "-".center(30, "-")
    count += 1
  end
end

# Method to print the number of students
def print_footer(students)
  puts "Overall we have #{students.count} great students"
end

# Method to print full list
def print(students)
  puts "Which letter would you like to print?"
  current_letter = gets.chop
  print_header
  print_list(students, current_letter)
  print_footer(students)
end

# Calling methods in order
students = input_students
if students.length != 0
  print(students)
end