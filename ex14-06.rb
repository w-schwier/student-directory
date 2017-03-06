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
  puts "3. Save the list"
  puts "4. Load the list"
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
      get_file("save")
      menu_break
    when "4"
      get_file("load")
      menu_break
    when "9"
      exit
    else
      puts "I don't know what that meant, try again using just a number"
  end
end

=begin
# doesn't work: ran function before get file, maybe use blocks? #
if calling the file like: get_file(save_students)
def get_file(function)
  puts "Please enter file name, press return for default"
  choice = STDIN.gets.chomp
  if choice == ''
    function
  else
    function(choice)
  end
end
=end

def get_file(function)
  puts "Please enter file name, press return for default"
  choice = STDIN.gets.chomp
  if function == "save"
    if choice == ''
      save_students
    else
      save_students(choice)
    end
  elsif function == "load"
    if choice == ''
      load_students
    else
      load_students(choice)
    end
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

def save_students(filename = "students.csv")
  File.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "Saved File to #{filename}"
end

def load_students(filename = "students.csv")
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      push_hash_to_array(name, cohort.to_sym)
    end
  end
  puts "Loaded #{@students.count} students from #{filename}"
end

try_load_students
interactive_menu
