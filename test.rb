
def age_check(birth)
    curr_time = Time.new
    age_comp = curr_time.year - 18
    date = birth.split('-')
    if date[0].to_i < age_comp 
        return true
    elsif date[0].to_i == age_comp
        if curr_time.month > date[1].to_i
            return true
        elsif curr_time.month == date[1].to_i && curr_time.day <= date[2].to_i
            return true
        end
    else
        return false
    end
end

