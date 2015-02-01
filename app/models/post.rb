class Post < ActiveRecord::Base
    belongs_to :category
    belongs_to :admin
    has_and_belongs_to_many :tags
    has_many :comments, dependent: :destroy

    validates :title, :category_id, :body, :admin_id,   presence: true
    validates :title,                                   uniqueness: true
    validates :title,                                   length: { maximum: 256 }

    def to_s
        return title
    end

    def get_full_date
        if updated_at > created_at
            return created_at + '/' + updated_at
        else
            return created_at
        end
    end
end
