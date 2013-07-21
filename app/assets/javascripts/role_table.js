$(document).ready (function() {

  $('#alphabetical').addClass('active');

  $('th').click(function(e){

    var column = this.id;

    var prevDirection;

    if ($(this).hasClass("desc")){
      prevDirection = "desc";
    }

    var that = this;
    e.preventDefault();
    $.ajax({
      url: '/roles/' + column,
      data: {'prev_direction' : prevDirection }
    }).success(function(response){
      $('th').removeClass('active');
      $(that).addClass('active');
      $(that).toggleClass('asc');
      $(that).toggleClass('desc');
      $('tbody tr').remove();
      $('tbody').append(response);
    });
  });

});