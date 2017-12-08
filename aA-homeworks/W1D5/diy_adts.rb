class Stack
    attr_reader :lifo_array

    def initalize(lifo_array = [])
        @lifo_array = lifo_array 
    end 
    
    def add(el)
        @lifo_array.push(el)
    end

    def remove
        @lifo_array.pop
    end

    def show
        @lifo_array
    end
end

test = Stack.new

class Queue
    def initalize
    @fifo_arr
    end

    def enqueue(el)
    @fifo_arr
    end

    def dequeue
    @fifo_arr
    end

    def show
    @fifo_arr
    end
end

class Map
end
