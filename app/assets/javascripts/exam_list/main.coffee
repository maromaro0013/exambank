class @ExamList
  m_table_template =
    "<table class='table'>
      <thead>
        <tr>
          <th>てすとへっだーです</th>
          <th>てすとへっだーです</th>
          <th>てすとへっだーです</th>
        </tr>
      </thead>
    </table>"

  create_from_data: (data)->
    return $(m_table_template)
