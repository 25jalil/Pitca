# -*- encoding: utf-8 -*-
# stub: decent_decoration 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "decent_decoration".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tomasz Pewi\u{144}ski".freeze]
  s.date = "2016-08-24"
  s.description = "Use decent_exposure with decorators (e.g. Draper)".freeze
  s.email = ["pewniak747@gmail.com".freeze]
  s.homepage = "https://github.com/netguru/decent_decoration".freeze
  s.required_ruby_version = Gem::Requirement.new("~> 2.0".freeze)
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Use decent_exposure with decorators (e.g. Draper)".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<decent_exposure>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rails>.freeze, ["~> 4.0"])
      s.add_development_dependency(%q<activesupport>.freeze, ["~> 4.0"])
      s.add_development_dependency(%q<draper>.freeze, ["~> 2.1"])
    else
      s.add_dependency(%q<decent_exposure>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rails>.freeze, ["~> 4.0"])
      s.add_dependency(%q<activesupport>.freeze, ["~> 4.0"])
      s.add_dependency(%q<draper>.freeze, ["~> 2.1"])
    end
  else
    s.add_dependency(%q<decent_exposure>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rails>.freeze, ["~> 4.0"])
    s.add_dependency(%q<activesupport>.freeze, ["~> 4.0"])
    s.add_dependency(%q<draper>.freeze, ["~> 2.1"])
  end
end
