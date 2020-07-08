class User < ApplicationRecord
    has_secure_password
    has_many :tasks
    has_many :projects, through: :tasks

    validates :email, :username, :password, presence: true
    validates :email, :username, uniqueness: true

    scope :most_projects, -> {joins(:projects).group(:user_id).order("COUNT(*) DESC").first}

end
