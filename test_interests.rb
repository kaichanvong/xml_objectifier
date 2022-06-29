require "test/unit"
require "./xml_editor"

class XMLEditorTest < Test::Unit::TestCase
	def setup
		@xml = open('interests.xml').read
	end

	def test_arrays
		actual = XML_Editor.new(@xml).to_a
		expects = %w{cats penguins}
		assert_equal(expects, actual)
	end

	def test_hashes
		actual = XML_Editor.new(@xml).to_hash
		expects = [{:name=>"cats"}, {:name=>"penguins"}]
		assert_equal(expects, actual)
	end

	def test_counting
		actual = XML_Editor.new(@xml).count
		expects = 2
		assert_equal(expects, actual)
	end
end
