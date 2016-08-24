m_exam_id = ''

m_choise_template =
  "<div class='exam_choise_input_area'>
    <input value='${text}'></input>
    <select>
      <option class='choise_correct_true' value='true'>○</option>
      <option class='choise_correct_false' value='false'>×</option>
    </select>
    <button class='btn btn-success'>更新</button>
    <button class='btn btn-warning'>削除</button>
  </div>"

push_choise_add_button = ->
  $.ajax({
    url: '/exam_choise_selects',
    type: 'post',
    data: {exam_id: m_exam_id},
    dataType: 'json'
    success: (data) ->
      $.tmpl("choiseTemplate", '').appendTo($('#edit_choise_selects'))
  })

get_choise_selects = ->
  $.ajax({
    url: '/exam_choise_selects',
    type: 'get',
    data: {exam_id: m_exam_id},
    dataType: 'json'
    success: (data) ->
      data.forEach( (d) ->
        select = $.tmpl("choiseTemplate", data)
        select.children('select').val(String(d.is_correct))
        select.appendTo($('#edit_choise_selects'))
      )
  })

$ ->
  m_exam_id = $('#attr_exam_id').data().examId
  $.template("choiseTemplate", m_choise_template)

  get_choise_selects()

  $('#choise_add_button').click(push_choise_add_button)
