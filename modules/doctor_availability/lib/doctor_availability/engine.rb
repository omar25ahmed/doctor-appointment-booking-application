module DoctorAvailability
  class Engine < ::Rails::Engine
    isolate_namespace DoctorAvailability

    config.autoload_paths += %W[
      #{root}/app/controllers
      #{root}/app/models
      #{root}/app/services
      #{root}/app/repositories
    ]

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
    end

    config.factory_bot.definition_file_paths << File.expand_path('../../spec/factories', root) if defined?(FactoryBot)
  end
end
