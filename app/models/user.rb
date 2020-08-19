class User < ApplicationRecord
    has_secure_password
    has_many :game_states
    has_many :records

    def high_score
      return self.records.all.order("score DESC").first
    end
end
