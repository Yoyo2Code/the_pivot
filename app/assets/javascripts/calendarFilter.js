$(document).ready(function() {


  let _propertyBookings;
  let _bookings = []
  let _properties = []
  let slug = window.location.pathname.split('/');
  let _path = getPath();
  let $properties = $('.item')
  let startDate;
  let endDate;

  function getPath() {
    let name = slug.slice(-1).toString();
    if (slug.indexOf('locations') === -1) {
      return `/api/v1/businesses/${name}`
    }
    else {
      return `/api/v1/locations/${name}`
    }
  }

  $(function() {
    $('#start-filter').datepicker({
      onSelect: function(dateText, inst) {
        let endingDate = $('#end-filter').datepicker('getDate')
        $.ajax({
          url: _path,
          type: 'GET',
          data: { startDate: parseDate(dateText), 
                  endDate: parseDate(
                    $.datepicker.formatDate('mm/dd/yy', endingDate)) },
          success: (response) => {
            console.log(response)
          }
        })
      }
    })
  });

  $( function() {
    $('#end-filter').datepicker({
      onSelect: function(dateText, inst) {
        let startDate = $('#start-filter').datepicker('getDate')
        $.ajax({
          url: _path,
          type: 'GET',
          data: { startDate: parseDate(
            $.datepicker.formatDate('mm/dd/yy', startDate)), 
                  endDate: parseDate(dateText) },
          success: (response) => {
            console.log(response)
          }
        })
      }
    })
  });

  function parseDate(dateText) {
    let splitDate = dateText.split('/')
    return { year: splitDate[2],
             month: splitDate[0],
             day: splitDate[1] }
  }
})
