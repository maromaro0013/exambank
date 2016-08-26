m_exam_id = ''

m_choise_template =
  "<div class='exam_choise_input_area'>
    <form>
      <input name='p[text]' value='${text}'></input>
      <select name='p[is_correct]'>
        <option class='choise_correct_true' value='true'>○</option>
        <option class='choise_correct_false' value='false'>×</option>
      </select>
      <a class='btn btn-success'>更新</a>
      <a class='btn btn-warning'>削除</a>
    </form>
  </div>"

push_choise_add_button = ->
  $.ajax({
    url: '/exam_choise_selects',
    type: 'post',
    data: {exam_id: m_exam_id},
    dataType: 'json'
    success: (data) ->
      select =$.tmpl("choiseTemplate", '')
      form = select.children('form')
      form.children('select').val(String(data.is_correct))
      form.children('.btn-success').click( ->
        push_choise_submit_button(data.id, form)
      )
      form.children('.btn-warning').click( ->
        push_choise_delete_button(data.id, select)
      )
      select.appendTo($('#edit_choise_selects'))
  })

get_choise_selects = ->
  $.ajax({
    url: '/exam_choise_selects',
    type: 'get',
    data: {exam_id: m_exam_id},
    dataType: 'json'
    success: (data) ->
      data.forEach( (d) ->
        select = $.tmpl("choiseTemplate", d)
        form = select.children('form')
        form.children('select').val(String(d.is_correct))

        form.children('.btn-success').click( ->
          push_choise_submit_button(d.id, form)
        )
        form.children('.btn-warning').click( ->
          push_choise_delete_button(d.id, select)
        )
        select.appendTo($('#edit_choise_selects'))
      )
  })

push_choise_submit_button = (choise_id, form) ->
  $.ajax({
    url: '/exam_choise_selects/' + choise_id,
    type: 'put',
    data: form.serializeArray(),
    dataType: 'json'
    success: (data) ->
      ''
  })

push_choise_delete_button = (choise_id, div) ->
  $.ajax({
    url: '/exam_choise_selects/' + choise_id,
    type: 'delete',
    data: '',
    dataType: 'json'
    success: (data) ->
      div.remove()
  })

$ ->
  m_exam_id = $('#attr_exam_id').data().examId
  $.template("choiseTemplate", m_choise_template)

  get_choise_selects()

  $('#choise_add_button').click(push_choise_add_button)
