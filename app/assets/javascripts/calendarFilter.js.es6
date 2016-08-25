$(document).ready(function() {


  let _propertyBookings;
  let _bookings = []
  let _properties = []
  let slug = window.location.pathname.split('/');
  let _path = getPath();
  let $properties = $('.item')
  let startDate;
  let endDate;
  let _names

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
            _properties = response.map(fetchPropertyNames)
            hideProperties()
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
            _properties = response.map(fetchPropertyNames)
            hideProperties()
          }
        })
      }
    })
  });

  function hideProperties() {
    $properties.each(( index, property ) => {
      let $divTitle = $(property).find('a').text().split('#')[0]
      if (_properties.indexOf($divTitle) !== -1) {
        $(property).slideUp(200)
      }
      else {
        $(property).slideDown(200)
      }
    })
  }

  function fetchPropertyNames(property) {
    return property.title.split('#')[0]
  }

  function parseDate(dateText) {
    let splitDate = dateText.split('/')
    return { year: splitDate[2],
             month: splitDate[0],
             day: splitDate[1] }
  }
})
