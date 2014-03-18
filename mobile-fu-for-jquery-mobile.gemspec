# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mobile-fu-for-jquery-mobile/version"
require 'rake'

Gem::Specification.new do |s|
  s.name        = "mobile-fu-for-jquery-mobile"
  s.version     = MobileFuForJqueryMobile::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Brendan Lim", "Ben Langfeld"]
  s.email       = ["weilaixiang86@gmail.com"]
  s.homepage    = "https://github.com/xuzh86/mobile-fu-jqm"
  s.summary     = %q{Automatically detect mobile requests from mobile devices in your Rails application.}
  s.description = %q{Want to automatically detect mobile devices that access your Rails application? Mobile Fu allows you to do just that. People can access your site from a Palm, Blackberry, iPhone, iPad, Nokia, etc. and it will automatically adjust the format of the request from :html to :mobile.}

  s.rubyforge_project = "mobile-fu-for-jquery-mobile"

  s.files         = FileList['lib/**/*.rb', '[A-Z]*'].to_a
  s.test_files    = FileList['test/*.rb'].to_a
  s.executables   = [ ]
  s.require_path  = 'lib'

  s.add_dependency 'rails'
  s.add_dependency 'rack-mobile-detect'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'httparty'
end
