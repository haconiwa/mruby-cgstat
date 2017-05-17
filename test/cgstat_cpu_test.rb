# Tests for CGStat::CPU

assert("CGStat::CPU#cpu_stat") do
  t = CGStat::CPU.open ""
  assert_equal(CGStat::CPU, t.class)

  stat = t.cpu_stat
  assert_equal(Hash, stat.class)
  %w(nr_periods nr_throttled throttled_time).each do |key|
    assert_true(stat.has_key? key)
  end
end

assert("CGStat::CPU#cpuacct_stat") do
  t = CGStat::CPU.open ""

  stat = t.cpuacct_stat
  assert_equal(Hash, stat.class)
  %w(user system).each do |key|
    assert_true(stat.has_key? key)
  end
end

assert("CGStat::CPU#cpuacct_usage") do
  t = CGStat::CPU.open ""

  usage = t.cpuacct_usage
  assert_true(usage >= 0)
end
