class Person
  attr_accessor :name, :age

  def initialize (name, age)
    @name = name
    @age = age
  end

  def get_info
    @additional_info = "interesting"
    "Name: #{@name}, age: #{@age}"
  end
end

person1 = Person.new("Joe",14)
person1.name= ("Bruce Becker")
p person1.instance_variables
puts person1.get_info
p person1.instance_variables
