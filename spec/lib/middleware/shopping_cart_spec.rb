require 'spec_helper'
require 'rack/mock'

describe PowerShop::Middleware::ShoppingCart do
  let(:app) do
    Rack::Builder.new do
      use PowerShop::Middleware::ShoppingCart
      run ->(env) { [200, {'Content-Type' => "text/html"}, ['Hello world!']] }
    end.to_app
  end

  let(:request) { Rack::MockRequest.new(app) }
  let(:session) { ActionController::TestSession.new }

  it 'creates shopping cart' do
    request.get(
      'http://www.myshop.com',
      'REQUEST_URI' => '/',
      'HTTP_HOST' => 'www.myshop.com',
      'rack.session' => session
    )

    expect(::ShoppingCart.exists?(session[:shopping_cart_id])).to eq true
  end
end
