m_exam_data = ''
m_exam_list = new ExamList()

get_exam_data = ->
  $.ajax({
    url: '/exams/list',
    type: 'post',
    dataType: 'json'
    success: (data) ->
      m_exam_data = data
      create_exam_list(m_exam_data)
  })

create_exam_list = ->
  $('#exams_all_list').append(m_exam_list.create_from_data(m_exam_data))

$ ->
  get_exam_data()
