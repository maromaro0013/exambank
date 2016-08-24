m_exam_id = ''

m_choise_template =
  "<div class='exam_choise_input_area'>
    <input></input>
    <select>
      <option value='true'>○</option>
      <option value='false'>×</option>
    </select>
    <button class='btn btn-success'>更新</button>
    <button class='btn btn-warning'>削除</button>
  </div>"

push_choise_add_button = ->
  $.tmpl("choiseTemplate", '').appendTo($('#edit_choise_selects'))

$ ->
  m_exam_id = $('#attr_exam_id').data().examId
  $.template("choiseTemplate", m_choise_template)

  $('#choise_add_button').click(push_choise_add_button)
