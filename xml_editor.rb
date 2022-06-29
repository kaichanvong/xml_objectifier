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

	def information
		headline_in_xml = StringIO.new(@args).readlines[0]
		xml_entity_to_hash(headline_in_xml)
	end

	def strip_attribute_value(val)
		val.gsub('"','')[0..-2]
	end

	def xml_entity_to_hash(str)
		obj = Hash.new; str.split(' ')[1..-1].map do |item| key, value = item.split('=')
			obj[key.to_sym] = strip_attribute_value(value)
		end
		obj
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
