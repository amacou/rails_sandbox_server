RailsSandboxServer::Engine.routes.draw do
  get 'rollback' => 'sandbox#rollback', as: :rollback
  post 'setup' => 'sandbox#setup', as: :setup
end
