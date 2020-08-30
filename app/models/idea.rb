class Idea < ApplicationRecord
  belongs_to :user, optional: true

  validates :content,    presence: true
  validates :ease,       presence: true
  validates :confidence, presence: true
  validates :impact,     presence: true

  validates_inclusion_of :ease, :in => 1..10
  validates_inclusion_of :confidence, :in => 1..10
  validates_inclusion_of :impact, :in => 1..10

  def average_score
    ((self.ease + self.confidence + self.impact) / 3.0).round(2)
  end
end
