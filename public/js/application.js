function get_iframe_markup() {
 var ids_array = [];
 $(".shared-calendars :checked").each(function() {
    ids_array.push($(this).val());
  });
 
  $.ajax({
    url: "/view",
    type: "POST",
    data: {ids : ids_array},
    success: function(data) {
              render_iframe(data);
             },
    error: function(data) {
            console.log("ERROR: " + data);
           }
  });
  return false;
}

function render_iframe(iframe_src) {
  $('.calendar iframe').remove();
  $('.calendar').append(iframe_src);
};