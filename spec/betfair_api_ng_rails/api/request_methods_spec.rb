require 'spec_helper'
require 'betfair_api_ng_rails/api/constants'

describe BetfairApiNgRails::Api::RequestMethods do
  let(:logger)   { double(:logger) }
  before do
    BetfairApiNgRails.config.locale = :en
    BetfairApiNgRails.log = logger
    allow(logger).to receive(:write)
  end

  BetfairApiNgRails::Api::Constants::SIMPLE_LISTING_FILTERED.each do |method|
    describe "##{method}" do
      it "calls run_request with proper params" do
        expect(TestModule).to receive(:run_request).with(method.underscore.to_sym, {filter: :filter, locale: :en})
        TestModule.send method.underscore.to_sym, filter: :filter
      end
    end
  end

  describe "#list_market_catalogue" do
    it "calls run_request with proper params" do
      expect(TestModule).to receive(:run_request).with(:list_market_catalogue, {filter: :filter, market_projection: [], sort: "", max_results: '1', locale: :en})
      TestModule.list_market_catalogue filter: :filter
    end
  end

  describe "#list_market_book" do
    it "calls run_request with proper params" do
      expect(TestModule).to receive(:run_request).with(:list_market_book, {market_ids: ['1'], price_projection: :priceProjection, order_projection: '', match_projection: '', currency_code: 'USD', locale: :en})
      TestModule.list_market_book market_ids: ['1'], price_projection: :priceProjection
    end
  end

  describe "#place_orders" do
    it "calls run_request with proper params" do
      expect(TestModule).to receive(:run_request).with(:place_orders, {market_id: "", instructions: [], customer_ref: ""}, "")
      TestModule.place_orders
    end
  end

  describe '#get_account_details' do
    it 'calls run request with proper params' do
      expect(TestModule).to receive(:run_request).with(:get_account_details, {}, "")
      TestModule.get_account_details
    end
  end

  describe '#get_account_funds' do
    it 'calls run request with proper params' do
      expect(TestModule).to receive(:run_request).with(:get_account_funds, {}, "")
      TestModule.get_account_funds
    end
  end

  describe "private method" do
    describe "#build_request_type" do
      it "returns proper api method name" do
        expect(TestModule.send(:build_request_type, 'some_value')).to eq 'someValue'
      end
    end

    describe "#run_request" do
      let(:params) { {key1: 'value'} }
      let(:connection) { double(:connection) }

      after(:each) { TestModule.send(:run_request, 'some_method', params) }

      it "calls request method with proper params" do
        expect_any_instance_of(BetfairApiNgRails::Api::Connection).to receive(:request).with('someMethod', params)
      end
    end
  end
end
