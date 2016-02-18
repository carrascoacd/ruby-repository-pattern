# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'store'
  s.version     = '1.0'
  s.date        = '2015-10-13'
  s.summary     = "store"
  s.description = "A code Test"
  s.authors     = ["Antonio Carrasco"]
  s.require_paths = %w(lib)
end