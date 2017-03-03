students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleono",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",
]

def print_header
  puts "The students of Villains Academy"
  puts '-' * 10
end

def print_names(names)
  names.each { |name| puts name }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print_names(students)
print_footer(students)
