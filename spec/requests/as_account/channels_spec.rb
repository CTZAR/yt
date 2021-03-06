# frozen_string_literal: true

require 'spec_helper'
require 'youhub/collections/channels'

describe Youhub::Collections::Channels, :device_app do
  subject(:channels) { Youhub::Collections::Channels.new auth: $account }

  context 'with a list of parts' do
    let(:part) { 'statistics' }
    let(:channel) { channels.where(part: part, id: 'UCxO1tY8h1AhOz0T4ENwmpow').first }

    specify 'load ONLY the specified parts of the channels' do
      expect(channel.instance_variable_defined?(:@snippet)).to be false
      expect(channel.instance_variable_defined?(:@status)).to be false
      expect(channel.instance_variable_defined?(:@statistics_set)).to be true
    end
  end
end
