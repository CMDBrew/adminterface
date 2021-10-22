class GeneratorTestCase < Rails::Generators::TestCase
  include DummyAppHelper

  def self.tests(klass)
    define_method :described_class do
      klass
    end

    super
  end

  def say_yes!
    described_class.any_instance.stubs(:yes?).returns(true)
  end

  def run_generator(args = [])
    super(args + %w[--force])
  end
end
