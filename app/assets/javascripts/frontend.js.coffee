# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$.fn.render_form_errors = (model_name, errors) ->
    form = this
    this.clear_form_errors()

    $.each(errors, (field, messages) ->
        input = form.find('input, select, textarea').filter(->
            name = $(this).attr('name')
            if name
                name.match(new RegExp(model_name + '\\[' + field + '\\(?'))
        )

        input.closest('.form-group').addClass('has-error')
        input.parent().append('<span class="help-block">' + $.map(messages, (m) -> m.charAt(0).toUpperCase() + m.slice(1)).join('<br />') + '</span>')
    )


$.fn.clear_form_errors = () ->
    this.find('.form-group').removeClass('has-error')
    this.find('span.help-block').remove()

$.fn.clear_form_fields = () ->
    this.find(':input, :textarea','#new_comment')
        .not(':button, :submit, :reset, :hidden')
        .val('')
        .removeAttr('checked')
        .removeAttr('selected')

$ ->
    $.ajaxSetup
        dataType: 'json'

    $("form#new_comment").on("ajax:success", (e, data, status, xhr) ->
        $("#comments_list").append(data['html'])
        $('#comments_list>article:last').effect('highlight')
    ).on("ajax:error", (e, data, status, xhr) ->
        $("form#new_comment").render_form_errors('comment', data.responseJSON['errors'])
    )
