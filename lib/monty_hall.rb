class MontyHall
  attr_accessor :count_experiments

  def initialize(count_experiments)
    @count_experiments = count_experiments
    @count_wins = 0
    @count_switching_wins = 0
    @experiments_history = []
  end

  def simulate_paradox
    (0..@count_experiments).each do |experiment|
      @count_wins += 1 if monty_paradox(false)
      @count_switching_wins += 1 if monty_paradox(true)
    end
  end

  def print_results
    puts 'Win frequencies:'
    puts "  staying: #{staying}%"
    puts "switching: #{switching}%"
  end

  def table_values
    [{ staying: staying },
     { switching: switching }]
  end

  def statistics
    @experiments_history
  end


  private
    def monty_paradox(switch)
      doors = (0...3).to_a
      winner_door = doors.shuffle.first
      choose_door = doors.shuffle.first
      monty_doors = doors - [winner_door, choose_door]
      opened_door = monty_doors[monty_doors.shuffle.first]
      other_choose = (doors - [choose_door, opened_door]).first

      choose_door = other_choose if switch
      result = choose_door == winner_door

      @experiments_history << { winner_door: winner_door, choose_door: choose_door, is_change_opinion: switch, result: result }

      result
    end

    def staying
      100.0 * @count_wins / @count_experiments
    end

    def switching
      100.0 * @count_switching_wins / @count_experiments
    end
end