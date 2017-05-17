##
## CGStat Test
##

assert("CGStat#hello") do
  t = CGStat.new "hello"
  assert_equal("hello", t.hello)
end

assert("CGStat#bye") do
  t = CGStat.new "hello"
  assert_equal("hello bye", t.bye)
end

assert("CGStat.hi") do
  assert_equal("hi!!", CGStat.hi)
end

assert("CGStat.const_hz") do
  assert_true(CGStat.const_hz >= 0)
end
