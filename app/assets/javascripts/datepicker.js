$(document).ready(function() {
  let startDate 
  $( function() {
    $('#datepicker1').datepicker({
      onSelect: function(dateText, inst) {
        console.log(dateText);
      }
    });

    $('#datepicker2').datepicker({
      onSelect: function(dateText, inst) {
        console.log(dateText);
      }
    })
  });

})
