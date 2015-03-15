require 'rails'
require 'rails_sandbox_server/engine'

class ActionController::Base
  before_action :sandbox_begin_transaction

  def sandbox_begin_transaction
    unless ActiveRecord::Base.connection.transaction_open?
      ActiveRecord::Base.connection.begin_transaction(joinable: false)
      logger.info "begin transaction #{ActiveRecord::Base.connection.current_transaction}"
    end
  end
end

module RailsSandboxServer
  class Railtie < Rails::Railtie
  end
end
