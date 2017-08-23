class Terminal
	attr_accessor :prices, :scanned

	def initialize
		@scanned = Hash.new(0)
		@prices = {}
	end

	def set_pricing(price_list)
		prices.replace(price_list)
	end

	def scan(item)
		if prices.has_key?(item)
			scanned[item] += 1
		else
			false
		end
	end

	def get_items
		while(true)
			puts "Enter item code or '.' if done:"
			item = gets.chomp

			break if item == "."

			unless scan(item)
				p "Item is not in the system"
			end
		end
	end

	def total
		total = 0

		scanned.each do |item, count|
			volume_amt = 1
			price = volume_price = prices[item]["price"]

			if volume = prices[item]["volume"]
				volume_amt = volume["amt"]
				volume_price = volume["price"]
			end

			count_breakdown = count.divmod(volume_amt)
			volume_total = count_breakdown[0]*volume_price
			individual_total = count_breakdown[1]*price
			item_total = volume_total + individual_total
			total += item_total
		end

		total
	end

	def print_total
		puts '$' + '%.2f' % (total/100.0)
	end
end