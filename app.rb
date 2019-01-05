require 'faker'
require './student'
require './classroom'
require './grade'


# Our four classrooms for the first years
A = Classroom.new("1A")
B = Classroom.new("1B")
C = Classroom.new("1C")
D = Classroom.new("1D")

def gen_student
  s = Student.new(Faker::Name.name, rand(11..20))
  s.reportcard.add_grade(Grade.new("math", rand(0..100)))
  s.reportcard.add_grade(Grade.new("history", rand(0..100)))
  s.reportcard.add_grade(Grade.new("english", rand(0..100)))
  s.reportcard.add_grade(Grade.new("science", rand(0..100)))
  s
end

# Generate our students
1..25.times do |i|
  A.add_student(gen_student())
end
1..25.times do |i|
  B.add_student(gen_student())
end
1..25.times do |i|
  C.add_student(gen_student())
end
1..25.times do |i|
  D.add_student(gen_student())
end

# Check the rosters
A.roster
puts ""
B.roster
puts ""
C.roster
puts ""
D.roster
puts ""


##########################################################
# CHALLENGE 1

def find_failing(classroom)
  classroom.students.each do |key, value|
    total = 0
    value.grades.each do |key, value|
      total = total + value
    end
    if total > 200
      puts "#{key}: PASS"
		else
			puts "#{key}: FAIL"
		end
	end
end

find_failing A

#########################################################
# CHALLENGE 2

def find_exceptional(classroom)
  classroom.students.each do |key,value|
      total = 0
      value.grades.map do |key, value|
        total = total + value
      end
      if total > 260
        puts "#{key}"
			end
	end
end

find_exceptional B

##########################################################
