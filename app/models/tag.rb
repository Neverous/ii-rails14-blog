class Tag < ActiveRecord::Base
    has_and_belongs_to_many :posts

    validates :name,    presence: true
    validates :name,    uniqueness: true

    def to_s
        return name
    end
end
