class Admin < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :rememberable, :trackable, :validatable, :lockable

    validate :username,   presence: true
    validate :username,   uniqueness: true

    def to_s
        return username
    end
end
