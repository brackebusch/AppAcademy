def add(num1, num2)
    num1 + num2
end

def subtract(num1, num2)
    num1 - num2
end

def sum(arr)
    return 0 if arr.length < 1
    arr.reduce(:+)
end

def multiply(*nums)
    nums.reduce(:*)
end

def power(num1, num2)
    num1 ** num2
end

def factoral(num)
    sum = 1

    until num < 1
        sum *= num
        num -= 1
    end        
sum
end