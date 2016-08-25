$(document).ready(function() {
  let $props = $('.item')
  let $prop
  let _propName
  let $propData

  $('#property_filter_name').on('keyup', function() {
    _propName = this.value.toLowerCase();
    $props.each(( index, property) => {
      $prop = $(property)
      $propData = $prop.data('title').toLowerCase()
      if ($propData.indexOf(_propName) !== -1) {
        $prop.show()
      }
      else {
        $prop.hide()
      }
    })
  })
})
