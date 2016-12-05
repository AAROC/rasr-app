class Person

  def initialize (name, age)
    @name = name
    self.age = age
  end
  def age= (new_age)
    @age ||= 5
    @age = new_age unless new_age >= 120
  end
  def get_info
    @additional_info = "interesting"
    "Name: #{@name}, age: #{@age}"
  end
end

person1 = Person.new("Joe")
person1.name= ("Bruce Becker")
p person1.instance_variables
puts person1.age
puts person1.get_info
p person1.instance_variables
