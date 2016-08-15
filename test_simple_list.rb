require "minitest/autorun"
require_relative "simple_list.rb"

class TestSimpleList < Minitest::Test
    def test_add_element_to_list
        list = SimpleList.new
        list.add("Lucia")
        assert_equal false, list.list_empty? 
    end

    def test_find_first_element
        list = SimpleList.new
        list.add("Lucia") 
        assert_equal "Lucia", list.fetch("Lucia")
    end

    def test_add_second_element
        list = SimpleList.new
        list.add("Lucia")
        list.add("Pedro")
        assert_equal 2, list.size
    end

    def test_find_second_element
        list = SimpleList.new
        list.add("Lucia")
        list.add("Pedro")
        assert_equal "Pedro", list.fetch("Pedro")
    end

    def test_find_element_that_not_exist
        list = SimpleList.new
        list.add("Lucia")
        list.add("Pedro")
        assert_equal nil, list.fetch("Sara")
    end

    def test_add_third_element
        list = SimpleList.new
        list.add("Lucia")
        list.add("Pedro")
        list.add("Sara")
        assert_equal 3, list.size
    end

    def test_find_third_element
        list = SimpleList.new
        list.add("Lucia")
        list.add("Pedro")
        list.add("Sara")
        assert_equal "Sara", list.fetch("Sara")
    end
end
