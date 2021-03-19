require_relative 'lib/rune_deck.rb'

config = YAML.load(File.open('config.yml'))

runes = RuneDeck.new(config['party_size'], config['awareness'], config['fudge'])

runes.draw_rune

runes.rune_details