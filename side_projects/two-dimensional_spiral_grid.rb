sum = 1
x = 1
counter = 0
magic_number = 361527

until sum > magic_number
    x += 2
    sum = x**2 #largest corner (bottom right)
    counter += 1 #how far from center in 1 direction
end

corner = sum

#find correct side
until corner < magic_number
    corner -= (counter * 2)
end

#find objective number distance from center vertically then add distance from center horizontally 
print (magic_number - (corner + counter)) + counter 

