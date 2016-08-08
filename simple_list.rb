require "minitest/autorun"

class TestSimpleList < Minitest::Test
    def test_add_element_to_list
        list = List.new
        list.add("Lucia")
        assert_equal false, list.list_empty? 
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

    def test_remove_first_element
        list = List.new
        list.add("Pedro")
        list.add("Sara")
        list.remove("Pedro")
        assert_equal ["Sara"], list.values 
    end

    def test_remove_last_element
        list = List.new
        list.add("Pedro")
        list.add("Sara")
        list.remove("Sara")
        assert_equal ["Pedro"], list.values 
    end

    def test_remove_element_that_not_exist
        list = List.new
        list.add("Lucia")
        list.add("Pedro")
        list.add("Sara")
        list.remove("Pablo")
        assert_equal ["Lucia", "Pedro", "Sara"], list.values 
    end
end

class List

    attr_accessor :name, :next_element

public
    def add(value) 
        if list_empty? 
            @element = List.new
            @element.name = value
        else
            new_element = List.new
            new_element.name = value
            last_element = find_last_element
            last_element.next_element = new_element
        end
    end

    def find(value)
        element = @element
        while exist?(element) and element.name != value do
            element = element.next_element
        end
        return exist?(element) ? element.name : nil 
    end

    def remove(value)
        if is_first_element?(value) 
            @element = @element.next_element
        else
            element = @element
            while exist?(element) and element.name != value do
                previous_element = element
                element = element.next_element
            end
            previous_element.next_element = element.next_element if exist?(element) 
        end
        return values
    end

    def values
        all_values = []
        element = @element
        while exist?(element) do
            all_values << element.name
            element = element.next_element
        end
        return all_values
    end

    def list_empty?
        @element == nil
    end

    def size
        elements = 0
        element = @element
        while exist?(element) do
            elements += 1
            element = element.next_element
        end
        return elements
    end

private
    def find_last_element
        last_element = @element
        while last_element.next_element != nil do
            last_element = last_element.next_element
        end
        return last_element
    end

    def is_first_element?(value)
        @element.name == value and list_empty? == false
    end

    def exist?(element)
        element != nil
    end
end
