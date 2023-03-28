class Developer < ApplicationRecord
  has_many :video_games

  def self.most_recent
    Developer.order(created_at: :desc)
  end

  def game_count
    self.video_games.count
  end
end