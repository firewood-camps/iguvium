# frozen_string_literal: true

require 'rspec'

RSpec.describe Iguvium::Page do
  subject(:page) { Iguvium.read(path)[page_index] }

  context 'auction pages' do
    let(:path) { 'spec/files/auction.pdf' }
    let(:page_index) { 0 }
    let(:tables) { page.extract_tables! }

    it { expect(page.text).to be_a String }

    it { expect(page.text.strip).to start_with 'ICANN New gTLD Contention Set Resolution Auction' }

    it '#extract_tables! returns 7 of Iguvium::Table' do
      expect(tables)
        .to have_attributes(count: 7)
        .and all be_a Iguvium::Table
    end
  end
end
