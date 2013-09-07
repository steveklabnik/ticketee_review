$(->
  $('a#add_another_file').click(->
    url = "/files/new?number=" + $('#files input').length
    $.get(url, 
      (data)->
          $('#files').append(data)
    )
  )
)
