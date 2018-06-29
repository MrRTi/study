require './test/test_helper'
require 'test/unit'
require 'rack/test'
require_relative './inatra'
require_relative './my_app'

class RackTest < Test::Unit::TestCase
  def test_it_says_hello_world_get
    browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
    browser.get '/hello'
    assert browser.last_response.ok?
    assert_equal 'GET Hello World', browser.last_response.body
  end

  def test_it_says_hello_world_post
    browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
    browser.post '/hello'
    assert browser.last_response.ok?
    assert_equal 'POST Hello World', browser.last_response.body
  end
end
