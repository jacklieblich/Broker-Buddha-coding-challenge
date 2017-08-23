require "test/unit"
require_relative '../lib/file_reader'
require_relative '../lib/terminal'

class TestTerminal < Test::Unit::TestCase

	def setup
		@terminal = Terminal.new
		prices = FileReader.new("data/prices.json")
		@terminal.set_pricing(prices.data)
	end

	def test_terminal_total_1
		['A', 'B', 'C', 'D', 'A', 'B', 'A', 'A'].each{ |item| @terminal.scan(item)}
		assert_equal(3240, @terminal.total)
	end

	def test_terminal_total_2
		['C', 'C', 'C', 'C', 'C', 'C', 'C'].each{ |item| @terminal.scan(item)}
		assert_equal(725, @terminal.total)
	end

	def test_terminal_total_3
		['A', 'B', 'C', 'D'].each{ |item| @terminal.scan(item)}
		assert_equal(1540, @terminal.total)
	end

end