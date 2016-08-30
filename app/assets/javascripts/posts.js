$(document).ready(function(){
		$(document).on('click', '.cbut', function(e, data) {
		var i = $(this).attr('iterate');
		var first = "#com_form"+i;
		var second = "#com_list"+i;
		$(first).slideToggle('slow');
	  $(second).slideToggle('slow');
	})

$(document).ready(function() {
  $("#posts .page").infinitescroll({
    navSelector: "nav.pagination",
    nextSelector: "nav.pagination a[rel=next]",
    itemSelector: "#posts tr.post"
  });
});

		
});