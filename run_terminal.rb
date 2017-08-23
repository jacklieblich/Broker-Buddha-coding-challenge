require_relative 'lib/file_reader'
require_relative 'lib/terminal'
terminal = Terminal.new
if ARGV.length > 0
	prices = FileReader.new(ARGV[0])
	ARGV.clear
else
	prices = FileReader.new("data/prices.json")
end
terminal.set_pricing(prices.data)
terminal.get_items
terminal.print_total