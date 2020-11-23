class Movie < ApplicationRecord
    has_many :voteup,  dependent: :destroy
    has_many :votedown,  dependent: :destroy
end

