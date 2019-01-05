require './reportcard'

class Student
	attr_accessor :name, :age, :reportcard
  def initialize(name, age)
    @name = name
    @age = age
    @reportcard = Reportcard.new
  end
end
