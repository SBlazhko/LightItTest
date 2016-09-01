$(document).ready(function(){
  // $(document).on('click', '.cbut', function(e, data) {
  //   // $(this).parent().nextAll('#hide_com').slideToggle('slow') 
  //   $('#hide_com').slideToggle('slow');     
  // })

  // $(document).on('click', '.up', function(e, data) {
  //   // $(this).parent().nextAll('.edit').slideToggle('slow') 
  //   $('.edit').slideToggle('slow');     
  // })

  $(document).on('click', '.up', function(e, data) {
		var i = $(this).attr('iterate');
		var first = "#edit"+i;
		$(first).slideToggle('slow');
	})

  $(document).on('click', '.cbut', function(e, data) {
		var i = $(this).attr('iterate');
		var first = "#hide_com"+i;
		$(first).slideToggle('slow');
	})
});
