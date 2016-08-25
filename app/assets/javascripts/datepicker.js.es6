$(document).ready(function() {
  let prop_id = getID()
  let bookings;
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


  function checkAvailability(date) {
    fetchDates()
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

  function fetchDates() {
    $.getJSON(`/api/v1/properties/${prop_id}`,
              (response) => { bookings = response })
  }

  function getID() {
    window.location.pathname.split('/').slice(-1).toString();
  }
})
