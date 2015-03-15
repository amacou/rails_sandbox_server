module RailsSandboxServer
  class Engine < Rails::Engine
    config.rails_sandbox_server = ActiveSupport::OrderedOptions.new
  end
end
