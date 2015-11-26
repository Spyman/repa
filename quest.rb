def who_win(score)
  first, second = score.split(':')
  return :first if first > second
  return :second if first < second
  :tie
end

def user_rate_result(real_scroe, user_rate_score)
  return 2 if real_scroe == user_rate_score
  return 1 if who_win(real_scroe) == who_win(user_rate_score)
  0
end


if user_rate_result("5:0", "5:0") != 2
  puts "full eq error"
end

if user_rate_result("5:0", "3:1") != 1
  puts "particial eq error"
end

if user_rate_result("5:0", "0:5") != 0
  puts "bad rate error"
end

if user_rate_result("0:0", "1:1") != 1
  puts "bad tie result"
end

