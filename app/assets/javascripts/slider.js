$(document).ready(function() {
  $(function() {
    $( '#slider-range' ).slider({
      range: true,
      min: 2500,
      max: 20000,
      values: [ 2500, 10000 ],
      slide: function( event, ui ) {
        $('#amount').val("$" + ui.values[0] + " - $" + ui.values[ 1 ] );
        showAvailable(ui.values);
      }
    });
    $('#amount').val("$" + $('#slider-range').slider( 'values', 0 ) + 
      " - $" + $('#slider-range').slider( 'values', 1 ) );
  });

  let $items = $('.item')
  let _items
  let _values
  $.getJSON('/api/v1/items.json', 
    (response) => { start(response) })

  function start(response) {
    _items = response
    _values = $('#slider-range').slider('values');
  }

  function showAvailable(values) {
    _items.forEach(( item, index ) => {
      if ( values[1] < item.price || values[0] > item.price ) {
        let $item = $items[index]
        $($item).fadeOut(500);
      }
      else if ( values[1] > item.price || values[0] < item.price ) {
        let $item = $items[index]
        $($item).fadeIn(500);
      }
    });
  }
});
