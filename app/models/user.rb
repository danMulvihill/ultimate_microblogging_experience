class User < ApplicationRecord
    has_many :posts
    has_many :coms
    # validates_presence_of :email
    validates :email, uniqueness: true, presence: true
end
