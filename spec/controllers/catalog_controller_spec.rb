# coding: utf-8
require 'spec_helper'

describe CatalogController, :type => :controller do
  describe 'GET index' do
    before { get :index, use_route: 'power_shop' }

    it { expect(response).to be_success }
  end
end

