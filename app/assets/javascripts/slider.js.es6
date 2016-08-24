$(document).ready(function() {
  $(function() {
    $( '#slider-range' ).slider({
      range: true,
      min: 40,
      max: 150,
      values: [ 40, 150 ],
      slide: function( event, ui ) {
        $('#amount').val("$" + ui.values[0] + " - $" + ui.values[ 1 ] );
        showAvailable(ui.values);
      }
    });
    $('#amount').val("$" + $('#slider-range').slider( 'values', 0 ) + 
      " - $" + $('#slider-range').slider( 'values', 1 ) );
  });

  let $items = $('.item')
  let slug = window.location.pathname
  let _items
  let _values
  $.getJSON(`/api/v1${slug}.json`, 
    (response) => { start(response) })

  function start(response) {
    _items = response
    _values = $('#slider-range').slider('values');
  }

  function showAvailable(values) {
    _items.forEach(( item, index ) => {
      if ( values[1] < item.price_per_guest || values[0] > item.price_per_guest ) {
        let $item = $items[index]
        $($item).fadeOut(500);
      }
      else if ( values[1] > item.price_per_guest || values[0] < item.price_per_guest ) {
        let $item = $items[index]
        $($item).fadeIn(500);
      }
    });
  }
});
