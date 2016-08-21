$(document).ready(function() {
  $('#location-pill').click('on', function() {
    $('#businesses').addClass('hide-me');
    $('#locations').removeClass('hide-me');
  });

  $('#business-pill').click('on', function() {
    $('#businesses').removeClass('hide-me');
    $('#locations').addClass('hide-me');
  });
});
