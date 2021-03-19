require 'yaml'

class RuneDeck

  attr_reader :drawn_rune, :rune_description, :rune_effect, :affects_member_number, :recharge
  attr_accessor :level

  def initialize(party_size, awareness, fudge)
    @runes = YAML.load(File.open('data/elder_runes.yml'))
    @drawn_rune = nil
    @rune_description = nil
    @rune_effect = nil
    @affects_member_number = nil
    @recharge = nil
    @level = 1
    @party_size = party_size
    @awareness = awareness
    @fudge = fudge
  end

  def draw_rune
    type = determine_type
    recharge_time = determine_awareness
    raise "Type must be ['Bane'] or ['Boon'] to function!" if (type!='Bane' && type!='Boon')

    rune = @runes.keys.sample

    @drawn_rune = "#{rune.possessive} #{type}"
    @rune_description = @runes[rune]['Description']
    @rune_effect = "Effect: #{@runes[rune][type]}"
    @affects_member_number = "This rune will affect the #{(rand(@party_size)+1).ordinalize} creature to pass through the gate."
    @recharge = "Halaster will recast a rune on this gate in #{recharge_time}"
  end

  def determine_type
    if @fudge
      @fudge.to_s.capitalize
    else
      %w[Bane Boon].sample
    end
  end

  def determine_awareness
    @awareness = 23-@level if @awareness == false
    time = rand(@awareness)
    if time == 0
      "#{rand(24) + 1} hour(s)."
    else
      "#{time} day(s)."
    end
  end

  def rune_details
    puts @drawn_rune
    puts @rune_description
    puts @rune_effect
    puts @affects_member_number
    puts @recharge
  end

end

# https://stackoverflow.com/a/1082089
class Fixnum
  def ordinalize
    if (11..13).include?(self % 100)
      "#{self}th"
    else
      case self % 10
      when 1; "#{self}st"
      when 2; "#{self}nd"
      when 3; "#{self}rd"
      else    "#{self}th"
      end
    end
  end
end

class String
  def possessive
    self[-1] == 's' ? "#{self}'" : "#{self}'s"
  end
end