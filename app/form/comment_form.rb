class CommentForm
    ValidationError = Class.new(StandardError)

    include Virtus.model
    include ActiveModel::Conversion
    include ActiveModel::Validations

    attribute :body, String
    attribute :post_id, Integer
    attribute :user_id, Integer

    validates :body, :user_id, :post_id,    presence: true

    def persisted?
        false
    end

    def validate!
        raise ValidationError, errors unless valid?
    end
end
