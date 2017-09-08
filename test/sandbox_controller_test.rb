require 'test_helper'

module RailsSandboxServer
  class SandboxControllerTest < ActionController::TestCase
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
    end

    test "should load fixture" do
      post :setup, params: { fixture: 'articles', fixtures_dir: Rails.root.join('test/another_fixtures/') }

      assert_response :success
    end

    test "should rollback" do
      post :setup, params: { fixture: 'articles' }
      assert_response :success

      get :rollback
      assert_response :success
    end
  end
end
