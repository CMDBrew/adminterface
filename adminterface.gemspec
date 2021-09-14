require_relative "lib/adminterface/version"

Gem::Specification.new do |spec|
  spec.name = "adminterface"
  spec.version = Adminterface::VERSION
  spec.authors = ["I-Lung Lee"]
  spec.email = ["ilung@hey.com"]
  spec.homepage = "https://github.com/cmdbrew/adminterface"
  spec.summary = "An add-on that brings Bootstrap 5 and other goodies into ActiveAdmin."
  spec.description = "See README.md"
  spec.license = "See LICENSE"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/releases"
  spec.metadata["github_repo"] = "ssh://github.com/cmdbrew/adminterface"

  spec.required_ruby_version = ">= 2.7"

  spec.files = Dir["{app,config,db,lib}/**/*", "LICENSE.md", "Rakefile", "README.md"]

  spec.add_dependency "activeadmin", "~> 2.9"
  spec.add_dependency "rails", ">= 6.0"
  spec.add_dependency "rainbow", "~> 3.0"
  spec.add_dependency "image_processing", "~> 1.0"
end