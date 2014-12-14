class CommentService
    def call(form_object)
        form_object.validate!
        Comment.create!(body: form_object.body, user_id: form_object.user_id, post_id: form_object.post_id)
    rescue form_object.class::ValidationError
        form_object
    end
end
