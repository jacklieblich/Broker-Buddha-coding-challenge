require 'json'
class FileReader

	attr_reader :data

	def initialize(file)
		file = File.read(file)
		@data = JSON.parse(file)
	end

end