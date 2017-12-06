def sum_to(n)
    return nil if n < 1
    return n if n == 0
    sum_to(n-1) + n 
end

def add_numbers(arr)
    return arr[0] if arr.length <= 1
    arr[0] + add_numbers(arr[1..-1])
end

def gamma_fnc(n)
    return 1 if n == 1
    gamma_fnc(n-1) * (n-1)
end

def ice_cream_shop(flavors, favorite)
    return false if flavors.empty?
    return true if flavors[0] == favorite
    ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(string)
    return string if string.length <= 1
    reverse(string[1..-1]) + string[0]
end