MRuby::Gem::Specification.new('mruby-cgstat') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Uchio Kondo'
  spec.version = '0.1.0'
  spec.summary = 'A mgem which is an accessor of cgroup stat'
  spec.description = spec.summary

  spec.add_dependency "mruby-io"
end
