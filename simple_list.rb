require "minitest/autorun"

class TestSimpleList < Minitest::Test
    def test_add_element_to_list
        list = List.new
        list.add("Lucia")
        assert_equal false, list.empty? 
    end
    def test_find_first_element
        list = List.new
        list.add("Lucia") 
        assert_equal "Lucia", list.find("Lucia")
    end
    def test_add_second_element
        list = List.new
        list.add("Lucia")
        list.add("Pedro")
        assert_equal 2, list.size
    end
    def test_find_second_element
        list = List.new
        list.add("Lucia")
        list.add("Pedro")
        assert_equal "Pedro", list.find("Pedro")
    end
    def test_find_element_that_not_exist
        list = List.new
        list.add("Lucia")
        list.add("Pedro")
        assert_equal nil, list.find("Sara")
    end
    def test_add_third_element
        list = List.new
        list.add("Lucia")
        list.add("Pedro")
        list.add("Sara")
        assert_equal 3, list.size
    end
    def test_find_third_element
        list = List.new
        list.add("Lucia")
        list.add("Pedro")
        list.add("Sara")
        assert_equal "Sara", list.find("Sara")
    end
    def test_find_second_element_in_list_with_size_three
        list = List.new
        list.add("Lucia")
        list.add("Pedro")
        list.add("Sara")
        assert_equal "Pedro", list.find("Pedro")
    end
    def test_return_all_values
        list = List.new
        list.add("Lucia")
        list.add("Pedro")
        list.add("Sara")
        assert_equal ["Lucia", "Pedro", "Sara"], list.values
    end
    def test_remove_element
        list = List.new
        list.add("Lucia")
        list.add("Pedro")
        list.add("Sara")
        list.remove("Pedro")
        assert_equal ["Lucia", "Sara"], list.values 
    end
end
class Element
    attr_accessor :name, :next_element
end
class List
    def add(value) 
        if empty?
            @element = Element.new
            @element.name = value
        else
            element = @element
            while element.next_element != nil do
                element = element.next_element
            end
            new_element = Element.new
            new_element.name = value
            element.next_element = new_element
        end
    end
    def find(value)
        element = @element
        while element != nil and element.name != value do
            element = element.next_element
        end
        return element != nil ? element.name : nil 
    end
    def remove(value)
        element = @element
        while element != nil and element.name != value do
            last_element = element
            element = element.next_element
        end
        last_element.next_element = element.next_element
        return values
    end
    def values
        all_values = []
        element = @element
        while element != nil do
            all_values << element.name
            element = element.next_element
        end
        return all_values
    end
    def size
        elements = 0
        element = @element
        while element != nil do
            elements += 1
            element = element.next_element
        end
        return elements
    end
    def empty?
        @element == nil
    end
end
