# frozen_string_literal: true

require 'spec_helper'
require 'youhub/models/asset'

describe Youhub::Asset do
  subject(:asset) { Youhub::Asset.new data: data }

  describe '#id' do
    context 'given fetching a asset returns an id' do
      let(:data) { { 'id' => 'A123456789012345' } }
      it { expect(asset.id).to eq 'A123456789012345' }
    end
  end

  describe '#type' do
    context 'given fetching a asset returns an type' do
      let(:data) { { 'type' => 'web' } }
      it { expect(asset.type).to eq 'web' }
    end
  end
end
