require_relative 'node'
class LinkedList
    def initialize(value)
        @head = Node.new(value, nil)
    end

    def append(value)
        if @head.nil?
            @head = Node.new(value, nil)
        else
            current_node = @head
            until current_node.next_node == nil
                current_node = current_node.next_node
            end
            current_node.next_node = Node.new(value, nil)
        end
    end

    def prepend(value)
        if @head.nil?
            @head = Node.new(value, nil)
        else
            current_node = @head
            @head = Node.new(value, current_node)
        end
    end

    def size
        return 'nil' if @head.nil?
        current_node = @head
        count = 1
        until current_node.next_node == nil
            current_node = current_node.next_node
            count += 1
        end
        count
    end

    def to_s
        return 'nil' if @head.nil?
        elements = []
        current_node = @head
        until current_node == nil
            elements << current_node.value
            current_node = current_node.next_node
        end
        elements << 'nil'
        elements.each do |value|
            value == 'nil' ? (print "#{value} \n") : (print "#{value} -> ")
        end
        nil
    end

    def head
        return nil if @head.nil?
        @head.value
    end

    def tail
        return 'nil' if @head.nil?
        current_node = @head
        until current_node.next_node == nil
            current_node = current_node.next_node
        end
        current_node.value
    end

    def pop
        return 'nil' if @head.nil?
        current_node = @head
        until current_node.next_node.next_node == nil
            current_node = current_node.next_node
        end
        popped_value = current_node.next_node.value
        current_node.next_node = nil
        popped_value
    end

    def contains?(value)
        current_node = @head
        until current_node == nil
            return true if current_node.value == value
            current_node = current_node.next_node
        end
        false
    end

    def find(value)
        current_node = @head
        count = 0
        until current_node == nil
            return count if current_node.value == value
            current_node = current_node.next_node
            count += 1
        end
        return 'nil'
    end

    def at(index)
        current_node = @head
        count = 0
        until current_node== nil
            return current_node.value if index == count
            current_node = current_node.next_node
            count += 1
        end
        return 'nil'
    end

    def insert_at(value, index)
        return 'nil' if @head.nil?
        current_node = @head
        count = 0
        if index == 0
            @head = Node.new(value, current_node)
            return
        end
        prev_node = current_node
        until current_node == nil
            if index == count
                new_node = Node.new(value, current_node)
                prev_node.next_node = new_node
                return
            end
            prev_node = current_node
            current_node = current_node.next_node
            count += 1
        end
    end

    def remove_at(index)
        return 'nil' if @head.nil?
        current_node = @head
        count = 0
        if index == 0
            @head = current_node.next_node
            return current_node.value
        end
        prev_node = current_node
        until current_node == nil
            if index == count
                prev_node.next_node = current_node.next_node
                return current_node.value
            end
            prev_node = current_node
            current_node = current_node.next_node
            count += 1
        end
    end
end
lists = LinkedList.new(4)
lists.append(5)
lists.append(4)
lists.append(78)
lists.append(2)
lists.prepend(12)
lists.prepend(45)
puts lists.pop
print "#{lists.to_s} "
puts lists.contains? (12)
puts lists.contains? (78)
puts lists.find(78)
puts lists.find(4)
puts lists.find(90)
puts lists.at(-4)
lists.insert_at(567, -5)
puts lists.remove_at(4)
puts lists.remove_at(0)
puts lists.size
puts lists.head
puts lists.tail
print "#{lists.to_s} "