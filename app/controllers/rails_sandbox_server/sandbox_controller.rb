require 'active_record/fixtures'
require 'find'
require 'base64'

module RailsSandboxServer
  class SandboxController < ActionController::Base
    rescue_from StandardError do |exception|
      puts exception
      puts exception.backtrace
      render plain: exception, status: 500
    end

    def setup
      fixtures = Array.wrap(params[:fixture] || params[:fixtures])
      path = params[:fixtures_dir] || fixture_path

      class_mapping = params[:mapping] || {}
      class_mapping.each do |k, v|
        class_mapping[k] = v.classify.constantize
      end

      ActiveRecord::FixtureSet.create_fixtures(path, fixtures, class_mapping)

      render plain: 'fixture load successfully'
    end

    def rollback
      ActiveRecord::Base.connection.rollback_db_transaction
      ActiveRecord::FixtureSet.reset_cache
      Rails.cache.clear

      render plain: 'rollback successfully'
    end

    def execute
      code = Base64.decode64(params[:code])
      result = eval(code)

      render plain: result
    end

    private

    def fixture_path
      Rails.root.join(Rails.configuration.rails_sandbox_server.fixture_path || 'test/fixtures')
    end
  end
end
