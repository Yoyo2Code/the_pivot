$(document).ready(function() {
  let bookings;
  fetchDates()

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

  function fetchDates() {
    $.ajax({
      url: `/api/v1/properties/${getID()}`,
      type: 'GET',
      success: (response) => {
        bookings = response
      }
    })
  }


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

  function getID() {
    return window.location.pathname.split('/').slice(-1).toString();
  }
})
