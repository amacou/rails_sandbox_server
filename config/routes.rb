RailsSandboxServer::Engine.routes.draw do
  get 'rollback' => 'rails_sandbox_server/sandbox#rollback', as: :rollback
  post 'setup' => 'rails_sandbox_server/sandbox#setup', as: :setup
  post 'execute' => 'rails_sandbox_server/sandbox#execute', as: :execute
end
