class Exercise < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true
    validates :muscle_group, presence: true
    validates :name, uniqueness: true
end