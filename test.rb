
def time_sence(seconds)
    seconds.to_f
    check = 1.0.next_float
    if seconds.to_f/60 < check
        return seconds.to_i.to_s + "s"
    elsif seconds.to_f/(60*60) < check
        return (seconds/60.to_i).to_s + 'm'
    elsif seconds.to_f/(60*60*24) < check
        puts('triped h')
        return (seconds/(60*60).to_i).to_s + 'h'
        
    elsif (seconds.to_f/(60*60*24*7)) < check
        puts('triped d')
        return (seconds/(60*60*24).to_i).to_s + 'd'
    else 
        return (seconds/(60*60*24*7).to_i).to_s + 'w'
    end
end

num=89367
puts(time_sence(num))
puts((num.to_f/(60*60*24*7)))
puts(1.0.next_float)