jQuery ->
  $("input#document_attachment").change ->
    file_name = $(this).val()
    $("form").submit() if file_name