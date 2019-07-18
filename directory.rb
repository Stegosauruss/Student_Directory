@students = [] # an empty array accessible to all methods
@letter = "a"
@students_select = []


# Methods for collecting student information

# Method to get cohort
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
  name = gets.chop
  while !name.empty? do
    cohort = get_cohort
    puts "and their hobbies?"
    hobby = gets.chop.to_sym
    puts "and their country of birth?"
    country = gets.chop.to_sym
    @students << {name: name, cohort: cohort, hobbies: hobby, birth_country: country}
    if @students.length == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{@students.count} students"
    end
    name = gets.chop
  end
end


# Methods to print the list

# Method to print header
def print_header
  puts "The students of Villains Academy".center(30, "-")
  puts "-".center(30, "-")
end

# method to select students based on letter and cut out names which are too long
def select_students
  months = {:january => 1, :february => 2, :march => 3, :april => 4, :may => 5, :june => 6, :july => 7, :august => 8, :september => 9, :october => 10, :november => 11, :december => 12}
  @students_select = @students.select do |student|
    student[:name][0] == @letter && student[:name].length < 12
  end
  @students_select = @students_select.sort_by {|student| months[student[:cohort]]}
end

# Method to print student list
def print_list
  count = 0
  while count < @students_select.length  do
    puts "#{count+1}. #{@students_select[count][:name]}".center(30, "-")
    puts "cohort: #{@students_select[count][:cohort]}".center(30, "-")
    puts "country of birth: #{@students_select[count][:birth_country]}".center(30, "-")   
    puts "hobbies: #{@students_select[count][:hobbies]}".center(30, "-")
    puts "-".center(30, "-")
    count += 1
  end
end

# Method to print the number of students
def print_footer
  puts "Overall we have #{@students.count} great students"
end

# Combined methods for full print
def show_students
  puts "Which letter would you like to print?"
  @letter = gets.chop
  select_students
  if @students_select.length != 0
    print_header
    print_list
    print_footer
  else
    puts "There are 0 students beginning with that letter"
  end
end


# Methods for menu options

# Print menu options for user
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      # input the students
      input_students
    when "2"
      # show the students
      show_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you mean, please try again"
  end
end 

# user input loop for menu options
def interactive_menu
  @students = []
  loop do
    print_menu
    process(gets.chomp)
  end
end


# Calling interactive menu
interactive_menu