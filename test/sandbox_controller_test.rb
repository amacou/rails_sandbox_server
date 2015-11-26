require 'test_helper'

module RailsSandboxServer
  class SandboxControllerTest < ActionController::TestCase

    test "should load fixture" do
      post :setup, fixture: 'articles', fixtures_dir: Rails.root.join('test/another_fixtures')

      assert_response :success
    end

    test "should rollback" do
      post :setup, fixture: 'articles'
      assert_response :success

      get :rollback
      assert_response :success
    end
  end
end
