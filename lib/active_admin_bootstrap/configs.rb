module ActiveAdminBootstrap
  CONFIGS = lambda {
    path = "lib/active_admin_bootstrap/fixtures"

    HashWithIndifferentAccess.new(
      breakpoints: YAML.load_file(Engine.root.join("#{path}/breakpoints.yml").to_s),
      components: YAML.load_file(Engine.root.join("#{path}/components.yml").to_s),
      css_classes: YAML.load_file(Engine.root.join("#{path}/css_classes.yml").to_s),
      layouts: YAML.load_file(Engine.root.join("#{path}/layouts.yml").to_s)
    )
  }.call.freeze
end
