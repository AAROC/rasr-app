class Player
  attr_reader :name, :age, :skill_level

  def initialize (name, age, skill_level)
    @name = name
    @age = age
    @skill_level = skill_level
  end

  def to_s
    "<#{name}: #{skill_level} (SL), #{age} (Age)>"
  end
end

class Team
  include Enumerable
  attr_accessor :name, :players

  def initialize (name)
    @name = name
    @players = []
  end

  def add_players (*players) # splat
    @players += players
  end

  def to_s
    "#{name} team: #{@players.join(", ")}"
  end

  def each
    @players.each { |player| yield player }
  end
end


player1 = Player.new("Bob",13,5)
player2 = Player.new("Mike",21, 5)
player3 = Player.new("Jim",16,10)
player4 = Player.new("Joe",19,41)
player5 = Player.new("Scott",65,100)

red_team = Team.new("red")
red_team.add_players(player1, player2, player3, player4, player5)

eligible_players = red_team.select {|player| (14..20) === player.age}
                           .reject {|player| player.skill_level < 20}

puts eligible_players
