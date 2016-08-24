$(document).ready(function() {
  $businesses = $('.business');
  $locations = $('.location');

  $('#business-pill').on('click', function() {
    $('#locations').addClass('hide-me')
    $('#businesses').removeClass('hide-me')
  });

  $('#location-pill').on('click', function() {
    $('#locations').removeClass('hide-me')
    $('#businesses').addClass('hide-me')
  });
})
