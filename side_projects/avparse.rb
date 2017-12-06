# avcode = File.open("avcode.txt")
# arr = avcode.readlines

# arr = arr.gsub(/\n|\t|\r/, " ").split

# arr.map! do |el|
#     el.split(/[\n,\t,\r]/).
# end

arr = []
$sum = 0

f = File.open("avcode.txt")
f.each_line do |line|
    arr << line
end

arr.map! do |el|
    el.split(/[\t,\r,\n]/).map!(&:to_i)
end

def d_test(compare_two)
    if compare_two.max % compare_two.min == 0
      p compare_two
        $sum += compare_two.max / compare_two.min
        return true
    end
  false
end

# arr.each do |x|
#   p x
# end


p arr.count

arr.each do |smaller_arr_of_numbers|
    smaller_arr_of_numbers.each_with_index do |number, idx|
        counter_index = idx+1
        while counter_index < smaller_arr_of_numbers.count
            compare_two = [number,smaller_arr_of_numbers[counter_index]]
            counter_index += 1
            d_test(compare_two)
            # break if 
        end
    end
end


p $sum