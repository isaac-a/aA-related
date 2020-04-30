class Stack

    def initialize
        @stack = []
    end

    def push(el)
        stack.push(el)
    end

    def pop
        stack.pop
    end

    def peek
        stack.first
    end

    private

    attr_reader :stack
end

class Queue

    def initialize
        @queue = []
    end

    def enqueue(el)
        queue.push(el)
    end

    def dequeue
        queue.shift
    end

    def peek
        queue.first
    end

    private

    attr_reader :queue
end

class Map

    def initialize
        @my_map = []
    end

    def set(key,value)
        index = my_map.index { |pairs| pairs[0] == key }
            if index
                my_map[index][1] = value
            else
                my_map.push([key, value])
            end
        value
    end

    def get(key)
        my_map.each { |pairs| return pairs[-1] if pairs[0] == key }
        nil
    end

    def delete(key)
        value = get(key)
        my_map.reject! { |pairs| pairs[0] == key }
        value
    end

    def show
        deep_dup(my_map)
    end

    private

    def deep_dup(arr)
        arr.map { |ele| ele.is_a?(Array) ? deep_dup(ele) : ele }
    end

    attr_reader :my_map
end