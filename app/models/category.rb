class Category < ActiveRecord::Base
    has_many :posts,    dependent: :destroy

    validates :name,    presence: true
    validates :name,    uniqueness: true

    def to_s
        return name
    end
end
