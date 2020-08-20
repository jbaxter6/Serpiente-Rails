class User < ApplicationRecord
    has_secure_password
    has_many :game_states
    has_many :records
    # validates :username, uniqueness: true
    # validates :username, length: { in: 5..10 }
    # validates :password, length: { in: 6..20 }

    def high_score
      return self.records.all.order("score DESC").first
    end
end
