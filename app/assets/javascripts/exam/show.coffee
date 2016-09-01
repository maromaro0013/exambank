m_exam_id = ''

get_choise_selects = ->
  $.ajax({
    url: '/exam_choise_selects',
    type: 'get',
    data: {exam_id: m_exam_id},
    dataType: 'json'
    success: (data) ->
      if data.length > 0
        $('#exam_show_content').after("<div id='exam_show_choice_selects'>もきゅん</div>")
        data.forEach( (d) ->
          console.log d
        )
  })

$ ->
  m_exam_id = $('#attr_exam_id').data().examId
  get_choise_selects()
