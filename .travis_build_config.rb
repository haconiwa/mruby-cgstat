MRuby::Build.new do |conf|
  toolchain :gcc
  conf.gembox 'default'
  conf.gem '../mruby-cgstat'
  conf.enable_test
  conf.enable_debug
end
