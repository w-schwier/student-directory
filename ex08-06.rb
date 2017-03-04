def input_students
  puts "Please enter the names of the students".center(50)
  puts "To finish, just hit return twice".center(50)
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "How old are they?".center(50)
    age = gets.chomp
    puts "What is their gender?".center(50)
    gender = gets.chomp
    students << {name: name, cohort: :novemeber, age: age, gender: gender}
    puts "Now we have #{students.count} students".center(50)
    puts "What is the next name you want to add?".center(50)
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts ('-' * 10).center(50)
end

def print_names(students)
  students.each_with_index { |student, i| puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort), Age: #{student[:age]}, Gender: #{student[:gender]}".center(50) }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

students = input_students
print_header
print_names(students)
print_footer(students)
