$ ->
  $('.select2-input').select2
    theme: 'bootstrap'

  $('.money-control').on 'blur', ->
    currentValue = parseFloat($(this).val())
    $(this).val(currentValue.toFixed(2))
