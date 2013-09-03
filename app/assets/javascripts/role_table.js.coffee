jQuery ->
  $('#roles').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    "aoColumns": [
            null,
            null,
            { "sType": "formatted-num" },
            null,
            null
        ]