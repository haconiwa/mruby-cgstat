class CGStat
  def self.cgroupfs_root
    @__cgroupfs_root__ ||= "/sys/fs/cgroup"
  end

  def self.cgroupfs_root=(newroot)
    @__cgroupfs_root__ = newroot
  end

  class CPU
    def self.cpu_subsystem
      "cpu"
    end

    def self.cpuacct_subsystem
      "cpuacct"
    end

    def initialize(name)
      @name = name
    end
    attr_reader :name

    def cpu_stat(fetch=nil)
      @cpu_stat ||= begin
                      tmp = nil
                      File.open("#{CGStat.cgroupfs_root}/#{CPU.cpu_subsystem}/#{self.name}/cpu.stat", 'r') do |f|
                        tmp = flattxt_to_hash(f.read, fetch)
                      end
                      tmp
                    end
    end

    def cpuacct_stat(fetch=nil)
      @cpuacct_stat ||= begin
                          tmp = nil
                          File.open("#{CGStat.cgroupfs_root}/#{CPU.cpuacct_subsystem}/#{self.name}/cpuacct.stat", 'r') do |f|
                            tmp = flattxt_to_hash(f.read, fetch)
                          end
                          tmp
                        end
    end

    def cpuacct_usage
      @cpuacct_usage ||= begin
                           tmp = nil
                           File.open("#{CGStat.cgroupfs_root}/#{CPU.cpuacct_subsystem}/#{name}/cpuacct.usage", 'r') do |f|
                             tmp = f.read.to_f
                           end
                           tmp
                         end
    end

    def reset_cpuacct_usage
      File.open("#{CGStat.cgroupfs_root}/#{CPU.cpuacct_subsystem}/#{name}/cpuacct.usage", 'w+') do |f|
        f.write("0")
      end
    end

    def reset_cache!
      @cpu_stat = nil
      @cpuacct_stat = nil
      @cpuacct_usage = nil
    end

    def self.open(name); new(name); end

    private
    def flattxt_to_hash(txt, fetch)
      tmp = {}
      txt.each_line do |l|
        key, value = l.chomp.split(' ')
        if fetch
          if key == fetch
            tmp[key] = value.to_f
            return tmp
          end
        else
          tmp[key] = value.to_f
        end
      end
      tmp
    end
  end

  def bye
    self.hello + " bye"
  end
end
