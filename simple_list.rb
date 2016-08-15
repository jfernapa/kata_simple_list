class SimpleList

    attr_accessor :name, :next_element

public
    def add(value) 
        if list_empty? 
            @element = SimpleList.new
            @element.name = value
        else
            new_element = SimpleList.new
            new_element.name = value
            last_element = find_last_element
            last_element.next_element = new_element
        end
    end

    def fetch(value)
        element = @element
        while exist_element?(element) and element.name != value do
            element = element.next_element
        end
        return exist_element?(element) ? element.name : nil 
    end

    def remove(value)
        if is_first_element?(value) 
            @element = @element.next_element
        else
            element = @element
            while exist_element?(element) and element.name != value do
                previous_element = element
                element = element.next_element
            end
            previous_element.next_element = element.next_element if exist_element?(element) 
        end
        return values
    end

    def values
        all_values = []
        element = @element
        while exist_element?(element) do
            all_values << element.name
            element = element.next_element
        end
        return all_values
    end

    def size
        elements = 0
        element = @element
        while exist_element?(element) do
            elements += 1
            element = element.next_element
        end
        return elements
    end

    def list_empty?
        @element == nil
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

    def exist_element?(element)
        element != nil
    end
end
