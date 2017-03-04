def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = [
    {name: "Dr. Hannibal Lecter", cohort: :novemeber},
    {name: "Darth Vader", cohort: :novemeber},
    {name: "Nurse Ratched", cohort: :novemeber},
    {name: "Michael Corleono", cohort: :novemeber},
    {name: "Alex DeLarge", cohort: :novemeber},
    {name: "The Wicked Witch of the West", cohort: :novemeber},
    {name: "Terminator", cohort: :novemeber},
    {name: "Freddy Krueger", cohort: :novemeber},
    {name: "The Joker", cohort: :novemeber},
    {name: "Joffrey Baratheon", cohort: :novemeber},
    {name: "Norman Bates", cohort: :novemeber}
  ]
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

def print_short_names(students)
    puts "These student(s)' names are 12 characters or less"
  students.each_with_index() do |student, i|
    if student[:name].length < 12
      puts "#{i +1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print_short_names(students,)
print_footer(students)
