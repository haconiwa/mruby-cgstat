# mruby-cgstat   [![Build Status](https://travis-ci.org/haconiwa/mruby-cgstat.svg?branch=master)](https://travis-ci.org/haconiwa/mruby-cgstat)
CGStat class
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'haconiwa/mruby-cgstat'
end
```
## example
```ruby
p CGStat.hi
#=> "hi!!"
t = CGStat.new "hello"
p t.hello
#=> "hello"
p t.bye
#=> "hello bye"
```

## License
under the MIT License:
- see LICENSE file
