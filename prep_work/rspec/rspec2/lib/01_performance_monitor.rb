def measure(repeats = 1, &proc) 
    start_time = Time.now
    repeats.times {proc.call}
    (Time.now - start_time) / repeats
end