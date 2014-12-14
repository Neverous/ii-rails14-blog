class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :post

    def to_s
        return 'Comment#' + id.to_s
    end
end
