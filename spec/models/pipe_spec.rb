require 'rails_helper'

RSpec.describe Pipe do
  describe '#fields' do
    it 'returns all fields in the pipe and it\'s phases' do
      pipe = pipes(:pipe)

      fields = pipe.fields

      expect(fields.size).to eq 2
      expect(fields).to eq [{
        'id' => 'phase_field',
        'label' => 'Phase Field'
      }, {
        'id' => 'pipe_field',
        'label' => 'Pipe Field'
      }]
    end
  end

  describe '#cards' do
    it 'returns all cards in the pipe' do
      pipe = pipes(:pipe)

      cards = pipe.cards

      expect(cards.size).to be 2
    end
  end
end
