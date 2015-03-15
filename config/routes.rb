RailsSandboxServer::Engine.routes.draw do
  delete 'rollback' => 'sandbox#rollback', as: :rollback
  post 'setup' => 'sandbox#setup', as: :setup
end
