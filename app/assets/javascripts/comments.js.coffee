jQuery ->
  $(".comment-button a").click ->
    window.post_comment_id = this.getAttribute("data-comment-id")
    $('#add-comment-modal').modal('show')
    $("#add-comment-modal").on "shown", ->
      $('#add-comment-modal textarea').focus()
    return false
  $("#save-comments").click ->
    user_comment = $('#add-comment-modal textarea').val()
    if user_comment == ""
      $('#add-comment-modal').modal('hide')
    else
      $.post "/comments",
        'comment[body]': user_comment
        'comment[document_id]': ""
        'comment[comment_id]': window.post_comment_id
        , (success) ->
          $('#add-comment-modal').modal('hide')
          $("#add-comment-modal").on "hidden", ->
            window.location.href = "http://localhost:3000/documents/1" # ajaxify
      
