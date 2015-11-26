require 'active_record/fixtures'
require 'find'

class SandboxController < ActionController::Base
  def setup
    fixtures = Array.wrap(params[:fixture] || params[:fixtures])
    path = params[:fixtures_dir] || fixture_path

    ActiveRecord::FixtureSet.create_fixtures(path, fixtures)

    render text: 'fixture load successfully'
  end


  def rollback
    logger.info "rollback transaction #{ActiveRecord::Base.connection.current_transaction}"
    ActiveRecord::Base.connection.rollback_transaction
    ActiveRecord::FixtureSet.reset_cache
    Rails.cache.clear

    render text: 'rollback successfully'
  end

  private

  def fixture_path
    Rails.configuration.rails_sandbox_server.fixture_path || 'test/fixtures'
  end
end
