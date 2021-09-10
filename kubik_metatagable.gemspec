require_relative "lib/kubik/metatagable/version"

Gem::Specification.new do |spec|
  spec.name        = "kubik_metatagable"
  spec.version     = Kubik::Metatagable::VERSION
  spec.authors     = ["Primate"]
  spec.email       = ["admin@primate.co.uk"]
  spec.homepage    = "https://github.com/primate-inc/kubik_metatagable"
  spec.summary     = "Meta tag engine for Rails"
  spec.description = "Meta tag engine for Rails"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/primate-inc/kubik_metatagable"
  spec.metadata["changelog_uri"] = "https://github.com/primate-inc/kubik_metatagable/blob/main/CHANGELOG.md"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 6"
  spec.add_dependency "rails-settings-cached", ">= 2"
end
