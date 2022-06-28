require "stringio"

class XML_PARSER
	def initialize(args)
		@args = args
	end

	def to_a
		get_interest_name(@args)
	end

	def to_hash
		interests = []
		get_interest_name(@args).map { |interest| interests << { :name => interest }  }
		interests
	end

	def get_interest_name(interest_xml)
		StringIO.new(interest_xml).readlines.map do |line|
			line = line.include?('name') ? line : nil
			line.split(/interest name="|\">/)[1] if line 
		end.compact
	end

end

xml_str = open('interests.xml').read
# <interests>
# <interest name="cats"></interest>
# <interest name="penguins"></interest>
# </interests>
puts XML_PARSER.new(xml_str).to_a
puts XML_PARSER.new(xml_str).to_hash
# [cats,penguins]
# [{:name=>"cats"} {:name=>"penguins"}]
