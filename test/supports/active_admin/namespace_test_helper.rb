module ActiveAdmin::NamespaceTestHelper
  def settings
    @settings ||= ActiveAdmin::SettingsNode.build(ActiveAdmin::NamespaceSettings)
  end

  def stub_namespace(params = {})
    params.each { |key, value| settings.send "#{key}=", value }
    settings
  end
end
