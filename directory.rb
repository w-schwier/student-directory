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

print_header
print_names(students)
print_footer(students)
