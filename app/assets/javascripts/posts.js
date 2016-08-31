$(document).ready(function(){
  $(document).on('click', '.cbut', function(e, data) {
    $(this).parent().nextAll('.row').slideToggle('slow')      
    $(this).parent().nextAll('ul').slideToggle('slow');
  })
});
