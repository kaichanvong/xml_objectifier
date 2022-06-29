require "stringio"

class XML_Editor
	def initialize(args)
		@args = args
	end

	def count
		get_interest_name(@args).length
	end

	def get_interest_name(interest_xml)
		StringIO.new(interest_xml).readlines.map do |line|
			line = line.include?('name') ? line : nil
			line.split(/interest name="|\">/)[1] if line 
		end.compact
	end

	def to_a
		get_interest_name(@args)
	end

	def to_hash
		interests = []
		get_interest_name(@args).map { |interest| interests << { :name => interest }  }
		interests
	end
end
