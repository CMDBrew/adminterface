require_relative "lib/adminterface/version"

Gem::Specification.new do |spec|
  spec.name = "adminterface"
  spec.version = Adminterface::VERSION
  spec.authors = ["I-Lung Lee"]
  spec.email = ["ilung@hey.com"]
  spec.homepage = "https://adminterface.io"
  spec.summary = "An add-on that brings Bootstrap 5 and other goodies into ActiveAdmin."
  spec.description = "An add-on that brings Bootstrap 5 and other goodies into ActiveAdmin."
  spec.license = "Nonstandard"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/cmdbrew/adminterface"
  spec.metadata["changelog_uri"] = "#{spec.homepage}/community/changelog"
  spec.metadata["github_repo"] = "ssh://github.com/cmdbrew/adminterface"

  spec.required_ruby_version = ">= 2.7"

  spec.files = Dir["{app,config,db,lib}/**/*", "LICENSE.md", "Rakefile", "README.md"]

  spec.add_dependency "activeadmin", "~> 2.9"
  spec.add_dependency "rails", ">= 6.0"
  spec.add_dependency "rainbow", "~> 3.0"
  spec.add_dependency "image_processing", "~> 1.0"
end
