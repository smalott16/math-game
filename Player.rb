class Player
  attr_accessor :name, :lives
  @@id = 0

  def initialize(name)
    @name = name
    @lives = 3
    @@id += 1
  end

  def lose_life
    @lives -= 1
  end

end