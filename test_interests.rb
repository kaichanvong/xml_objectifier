require "test/unit"
require "./xml_objectifier"

class XMLObjectifierTest < Test::Unit::TestCase
	def setup
		xml = '<interests date="29/6/2022">
					<interest name="cats"></interest>
					<interest name="penguins"></interest>
				</interests>
				<interests date="1/7/2022">
					<interest name="cats"></interest>
					<interest name="penguins"></interest>
					<interest name="dogs"></interest>
				</interests>'
		@xml = XML_Objectifier.new(xml) end

	def test_arrays
		actual = @xml.to_a
		expects = %w{cats penguins cats penguins dogs}
		assert_equal(expects, actual)
	end

	def test_counting
		actual = @xml.count
		expects = 5
		assert_equal(expects, actual)
	end

	def test_hashes
		actual = @xml.to_hash
		expects = [{:name=>"cats"}, {:name=>"penguins"},{:name=>"cats"}, {:name=>"penguins"}, {:name=>"dogs"}]
		assert_equal(expects, actual)
	end

	def test_date_information_xml_attributes
		actual = @xml.date_information
		expects = [{ :date => '29/6/2022' }, { :date => '1/7/2022' } ]
		assert_equal(expects, actual)
	end

end
