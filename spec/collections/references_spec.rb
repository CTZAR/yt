# frozen_string_literal: true

require 'spec_helper'
require 'youhub/collections/references'
require 'youhub/models/content_owner'

describe Youhub::Collections::References do
  subject(:collection) { Youhub::Collections::References.new parent: content_owner }
  let(:content_owner) { Youhub::ContentOwner.new id: 'any-id' }
  let(:page) { { items: [], token: 'any-token' } }
  let(:query) { { id: 'reference-id' } }

  describe '#count' do
    context 'called once with .where(query) and once without' do
      after do
        collection.where(query).count
        collection.count
      end

      it 'only applies the query on the first call' do
        expect(collection).to receive(:fetch_page) do |options|
          expect(options[:params]).to include query
          page
        end
        expect(collection).to receive(:fetch_page) do |options|
          expect(options[:params]).not_to include query
          page
        end
      end
    end
  end
end
