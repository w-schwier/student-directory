def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "How old are they?"
    age = gets.chomp
    puts "What is their gender?"
    gender = gets.chomp
    students << {name: name, cohort: :novemeber, age: age, gender: gender}
    puts "Now we have #{students.count} students"
    puts "What is the next name you want to add?"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts '-' * 10
end

def print_names(students)
  students.each_with_index { |student, i| puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort), Age: #{student[:age]}, Gender: #{student[:gender]}" }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print_names(students)
print_footer(students)
