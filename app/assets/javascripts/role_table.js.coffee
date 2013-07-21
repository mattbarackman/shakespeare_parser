$(document).ready ->

  $("th").click (e) ->
    e.preventDefault()
    prevDirection = "desc"  if $(this).hasClass("desc")
    columnHeader = this    
    rowsRequest = (action) ->
      $.ajax(
        url: window.location.pathname + '/' + action
        data:
          prev_direction: prevDirection
      )

    reassignActive = () ->
      $("th").removeClass "active"
      $(columnHeader).addClass "active"
      
    toggleDirection = () ->
      $(columnHeader).toggleClass "asc desc"

    rerenderRows = (response) ->
      $("tbody tr").remove()
      $("tbody").append response

    rowsRequest(@id).success (response) ->
      reassignActive()
      toggleDirection()
      rerenderRows(response)


