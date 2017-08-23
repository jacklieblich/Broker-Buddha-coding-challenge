require_relative 'file_reader'
require_relative 'terminal'
terminal = Terminal.new
if ARGV.length > 0
	prices = FileReader.new(ARGV[0])
	ARGV.clear
else
	prices = FileReader.new("prices.json")
end
terminal.set_pricing(prices.data)
terminal.get_items
terminal.print_total