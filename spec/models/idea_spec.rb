require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe 'average_score' do
    it 'calculates correctly' do
      idea = Idea.create(content: 'Some new idea', ease: 4, impact: 3, confidence: 13)
      expect(idea.average_score).to eq(6.67)
    end
  end
end
