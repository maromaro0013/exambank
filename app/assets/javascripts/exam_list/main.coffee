class @ExamList
  m_table_template =
    "<table id='exam_list_table' class='table table-hover table-bordered'>
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Type</th>
          <th>Actions</th>
        </tr>
      </thead>
    </table>"

  m_exam_template =
    "<tr>
      <td>${id}</td>
      <td>${name}</td>
      <td>${type}</td>
      <td>
        <a href='/exams/${id}/edit' class='icon-edit'></a>
        <a href='javascript:void(0);' class='icon-destroy'></a>
      </td>
    </tr>"

  create_list_from_data: (data)->
    $('#exam_list_table').remove()

    list = $(m_table_template)
    $.template("examTemplate", m_exam_template)

    for d in data
      $.tmpl("examTemplate", d).appendTo(list)

    return list
