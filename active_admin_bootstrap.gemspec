require_relative "lib/active_admin_bootstrap/version"

Gem::Specification.new do |spec|
  spec.name = "active_admin_bootstrap"
  spec.version = ActiveAdminBootstrap::VERSION
  spec.authors = ["I-Lung Lee"]
  spec.email = ["ilung@hey.com"]
  spec.homepage = "https://github.com/ilunglee/active_admin_bootstrap"
  spec.summary = "Addon for ActiveAdmin"
  spec.description = "Add Bootstrap themes and common UI components for ActiveAdmin"
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/releases"

  spec.required_ruby_version = ">= 2.7"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "activeadmin", ">= 2.9.0"
  spec.add_dependency "rails", "~> 6.1"
end
