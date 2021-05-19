class Exercise < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true
    validates :muscle_group, presence: true
end