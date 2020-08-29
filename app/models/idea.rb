class Idea < ApplicationRecord
  belongs_to :user, optional: true

  validates :content,    presence: true
  validates :ease,       presence: true
  validates :confidence, presence: true
  validates :impact,     presence: true

  def average_score
    ((self.ease.to_f + self.confidence.to_f + self.impact.to_f) / 3).round(2)
  end
end
