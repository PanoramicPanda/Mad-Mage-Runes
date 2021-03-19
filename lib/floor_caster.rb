require 'yaml'

class FloorCaster

  attr_accessor :current_level

  def initialize
    @config = YAML.load(File.open('config.yml'))
    @levels = YAML.load(File.open('data/gates.yml'))
    @runes = RuneDeck.new
    @current_level = determine_current_level
  end

  def cast_runes_on_gates
    raise "[current_level] must be set in config." unless @current_level
    raise "There are no gates for Level #{@current_level}" unless @levels.has_key?("Level_#{@current_level}")

    floor_flourish
    @runes.level = @current_level
    gates = @levels["Level_#{@current_level}"]
    gates.each do |gate|
      easy_start?
      hard_finish?
      @runes.draw_rune
      gate_detail(gate)
      @runes.rune_details
    end

  end

  def easy_start?
    if @current_level <= 8 && @config['easy_start']
      if rand(10)<6
        @runes.fudge = 'Boon'
      else
        @runes.fudge = @config['fudge']
      end
    end
  end

  def hard_finish?
    if @current_level >= 16 && @config['hard_finish']
      if rand(10)<6
        @runes.fudge = 'Bane'
      else
        @runes.fudge = @config['fudge']
      end
    end
  end

  def determine_current_level
    if @config['current_level']
      @config['current_level']
    else
      false
    end
  end

  def floor_flourish
    puts '===================='
    puts "Level #{@current_level}"
    puts '===================='
  end

  def gate_detail(gate)
    puts "----- #{gate} -----"
  end

end