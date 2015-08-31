$ ->
  columns = $('.list-column');
  previous_letter = null
  continuing = null

  for column in columns
    previous_letter = null

    for item in $(column).find('.list-item')
      current_letter = $(item).text()[0]

      if previous_letter == null
        continuing_text = if continuing == current_letter then ' (cont.)' else ''
        $(
          "<legend>#{current_letter.toUpperCase()}" +
          "#{continuing_text}</legend>"
        ).insertBefore($(item).parent())
      else if previous_letter != current_letter
        $('<ul>')
          .insertAfter($(item).parent())
          .append($(item).nextAll().andSelf())
        $("<legend>#{current_letter.toUpperCase()}</legend>")
          .insertBefore($(item).parent())

      previous_letter = current_letter
    continuing = previous_letter
