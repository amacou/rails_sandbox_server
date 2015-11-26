require 'active_record/fixtures'
require 'find'
require 'base64'

class SandboxController < ActionController::Base
  def setup
    fixtures = Array.wrap(params[:fixture] || params[:fixtures])
    path = params[:fixtures_dir] || fixture_path

    class_mapping = params[:mapping] || {}
    class_mapping.each do |k, v|
      class_mapping[k] = v.classify.constantize
    end

    ActiveRecord::FixtureSet.create_fixtures(path, fixtures, class_mapping)

    render text: 'fixture load successfully'
  end

  def rollback
    logger.info "rollback transaction #{ActiveRecord::Base.connection.current_transaction}"
    ActiveRecord::Base.connection.rollback_transaction
    ActiveRecord::FixtureSet.reset_cache
    Rails.cache.clear

    render text: 'rollback successfully'
  end

  def execute
    code = Base64.decode64(params[:code])
    result = eval(code)

    render text: result
  end

  private

  def fixture_path
    Rails.configuration.rails_sandbox_server.fixture_path || 'test/fixtures'
  end
end
