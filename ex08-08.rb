def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "What cohort are they in?"
    cohort = gets.chomp.to_sym
    students << {name: name, cohort: cohort}
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
  cohorts = students.sort_by { |name, cohort| cohort }
  cohorts.each_with_index { |student, i| puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print_names(students)
print_footer(students)
