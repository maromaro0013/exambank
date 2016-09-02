m_exam_id = ''
m_choise_radio_template = "
  <div>
    ${text}<input type='radio' name='choise_select_radio' value='${id}'>
  </div>"

create_choise_from_data = (data)->
  if data.length <= 0
    return

  $('#exam_show_content').after("<div id='exam_show_choice_selects'>選択肢</div>")
  $.tmpl("choiseRadioTemplate", data).appendTo($('#exam_show_choice_selects'))

get_choise_selects = ->
  $.template("choiseRadioTemplate", m_choise_radio_template)

  $.ajax({
    url: '/exam_choise_selects',
    type: 'get',
    data: {exam_id: m_exam_id},
    dataType: 'json'
    success: (data) ->
      create_choise_from_data(data)
  })

$ ->
  m_exam_id = $('#attr_exam_id').data().examId
  get_choise_selects()
