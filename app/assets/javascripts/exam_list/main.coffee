class @ExamList
  m_table_template =
    "<table class='table table-hover table-bordered'>
      <thead>
        <tr>
          <th>#</th>
          <th>name</th>
          <th>type</th>
        </tr>
      </thead>
    </table>"

  m_exam_template =
    "<tr>
      <td>${id}</td>
      <td>${name}</td>
      <td>${type}</td>
    </tr>"

  create_list_from_data: (data)->
    list = $(m_table_template)
    $.template("examTemplate", m_exam_template)

    for i in[0..(data.length - 1)]
      $.tmpl("examTemplate", data[i]).appendTo(list)

    return list
