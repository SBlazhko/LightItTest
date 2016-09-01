$(document).ready(function(){
  
  $(document).on('click', '.cbut', function(e, data) {
    $(this).parents('.row').next('.hide_com').slideToggle('slow') 
  })

  $(document).on('click', '.up', function(e, data) {
    $(this).next().slideToggle('slow')     
  })
});
