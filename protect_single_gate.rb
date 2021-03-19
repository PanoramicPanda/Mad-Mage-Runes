require_relative 'lib/rune_deck.rb'

config = YAML.load(File.open('config.yml'))

runes = RuneDeck.new

runes.draw_rune(config['party_size'], config['awareness'], config['fudge'])

runes.rune_details