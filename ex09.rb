def interactive_menu
  students = []
  loop do
    #1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    #2. Read the input and save it into a variable
    selection = gets.chomp
    #3. Do what the user has asked
    case selection
      when "1"
        # Input students
        students = input_students
      when "2"
        # Show the students
        print_header
        print_names(students)
        print_footer(students)
      when "9"
        # Exits program
        exit
      else
        puts "I don't know what that meant, try again using just a number"
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :novemeber}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts '-' * 10
end

def print_names(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

interactive_menu
