module Admin::DashboardHelper
  
  def drop_zero(string_array)                          # this will take 2 digits ["5","4"]
    array = string_array.collect { |num| Integer(num)} # take an array of individual numbers in string form ie. ["4", "5", "6"], convert them to numbers [4,5,6] 
    if array[-2] == 0                                  # is the first number of the two slots 0?
      array[-1]                                        # if the first number is 0, just return the 2nd digit
    else                                               # if the first digit is not zero
      array.join                                       # [2,8].join -> 28 
    end
  end
  
  
  def format_created_at(created_at)
    date_array = created_at.to_s.split("")
    "#{drop_zero(date_array[5,2])}.#{drop_zero(date_array[8,2])}.#{date_array[2,2].join}"
  end
  
  def format_created_at_with_slash(created_at)
    date_array = created_at.to_s.split("")
    "#{drop_zero(date_array[5,2])}/#{drop_zero(date_array[8,2])}/#{date_array[2,2].join}"
  end
  
  def adjust_military_time(number_as_string)
    if number_as_string.to_i == 0        # if hour is 0, then 12
      12
    elsif number_as_string.to_i >= 13     # if hour is greater than 13 [13-23], subtract 12
      number_as_string.to_i - 12
    else                           #else if hour is 1-12, just put the hour
      number_as_string.to_i
    end
  end
  
  def format_time_created_at(created_at)
  
    date_array = created_at.to_s.split("") # take the default created at value separate it into individual compoents into an array
    am_or_pm = if created_at.hour < 12 then "AM" else "PM" end # there are 24 hours of the day. if the hour is less than 12, it's AM, if not, it's pm
     "#{adjust_military_time(drop_zero(date_array[11,2]))}:#{date_array[14,2].join} #{am_or_pm}" 
  end
end
