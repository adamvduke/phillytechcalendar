function checked_calendars() {
    var ids_array = [];
    $(".shared-calendars :checked").each(function() {
        ids_array.push($(this).val());
    });
    return ids_array;
}

function refresh_calendars(data) {
    $('.calendar').fullCalendar('removeEvents');
    $.each(data, function(index, value) {
        $('.calendar').fullCalendar('addEventSource', value);
    });
}

function get_calendars() {
    $.ajax({
        url: "/calendars",
        type: "GET",
        data: {
            ids: checked_calendars()
        },
        success: function(data) {
            refresh_calendars(data);
        },
        error: function(data) {
            console.log("ERROR: " + data);
        }
    })
}

function calendar_checked() {
    $.ajax({
        url: "/calendars",
        type: "POST",
        data: {
            ids: checked_calendars()
        },
        success: function(data) {
            refresh_calendars(data);
        },
        error: function(data) {
            console.log("ERROR: " + data);
        }
    });
}

$(document).ready(function() {
    $('.calendar').fullCalendar({});
    get_calendars();
})