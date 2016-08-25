$(document).ready(function() {
  $( function() {
    $('#datepicker1').datepicker({
      beforeShowDay: checkAvailability,
      minDate: 0,
      onSelect: function(dateText, inst) {
      }
    });
  });

  $( function() {
    $('#datepicker2').datepicker({
      beforeShowDay: checkAvailability,
      minDate: 0,
      onSelect: function(dateText, inst) {
      }
    })
  });

  let prop_id = window.location.pathname.slice(-1)
  let bookings 
  $.getJSON(`/api/v1/properties/${prop_id}`,
            (response) => { bookings = response })

  function checkAvailability(date) {
    let y = date.getFullYear();
    let m = date.getMonth();
    let d = date.getDate();
    let currentDate = (m + 1) + '/' + d + '/' + y;
    if (bookings.indexOf(currentDate.toString()) === -1) {
      return [true];
    }
    else {
      return [false, "", "Booked"]
    }
  }

})
