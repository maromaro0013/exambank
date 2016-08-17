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

  get_list: ->
    return $(m_table_template)
