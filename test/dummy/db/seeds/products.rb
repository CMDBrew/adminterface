YAML.load_file(File.expand_path("../fixtures/products.yml", __FILE__)).each do |product|
  Product.create! product
end
