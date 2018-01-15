require "rails_helper"

RSpec.describe ApplicationHelper do
  describe '#format_date' do
    it 'returns nil when the date is not present' do
      expect(format_date(nil)).to be_nil
    end

    it 'returns the date properly formated when the date is present' do
      expect(format_date(Date.new(2017, 10, 1))).to eq '01/10/2017'
    end
  end
end
