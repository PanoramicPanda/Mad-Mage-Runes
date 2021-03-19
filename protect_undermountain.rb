require 'yaml'
require_relative 'lib/rune_deck.rb'
require_relative 'lib/floor_caster.rb'

levels = YAML.load(File.open('data/gates.yml'))
floor = FloorCaster.new

levels.keys.each do |level|
  current_level = level.delete("Level_").to_i
  floor.current_level = current_level
  floor.cast_runes_on_gates
  puts "\n"
end