@students = []

def menu_break
  puts "Press return to get back to menu"; STDIN.gets.chomp
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
    puts "Auto-load complete"
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def print_menu
  puts '-' * 10
  puts "1. Input students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      $s_count = 0
      input_students
      puts "You've inputed #{$s_count} students"
      $s_count = 0
      menu_break
    when "2"
      show_students; menu_break
    when "3"
      save_students
      puts "Saved students"
      menu_break
    when "4"
      load_students; menu_break
    when "9"
      exit
    else
      puts "I don't know what that meant, try again using just a number"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    push_hash_to_array(name)
    puts "Now we have #{@students.count} students"
    $s_count += 1
    name = STDIN.gets.chomp
  end
end

def push_hash_to_array(name = name, cohort = :november)
  @students << {name: name, cohort: cohort}
end

def show_students
  print_header; print_student_list; print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts '-' * 10
end

def print_student_list
  @students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    push_hash_to_array(name, cohort.to_sym)
  end
  file.close
  puts "Loaded #{@students.count} students from #{filename}"
end

try_load_students
interactive_menu
