function get_iframe_markup() {
 var ids_array = $(".calendars input[checked]").val()
 $.ajax({
    url: "/view",
    type: "POST",
    data: ids_array
   });
}