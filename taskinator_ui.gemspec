require_relative "lib/taskinator_ui/version"

Gem::Specification.new do |spec|
  spec.name        = "taskinator_ui"
  spec.version     = TaskinatorUi::VERSION
  spec.authors     = ["Bogdan Guban"]
  spec.email       = ["bogdan@seekingalpha.com"]
  spec.homepage    = "https://test.com/bla"
  spec.summary     = "Summary of TaskinatorUi."
  spec.description = "Description of TaskinatorUi."
    spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 5.0.0"
end
