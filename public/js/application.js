function calendar_ids_for_selector(selector) {
	var ids_array = [];
	$(selector).each(function() {
		ids_array.push($(this).val());
	});
	return ids_array;
}

function checked_calendar_ids() {
	return calendar_ids_for_selector(".shared-calendars :checked");
}

function unchecked_calendar_ids() {
	return calendar_ids_for_selector(".shared-calendars input:checkbox:not(:checked)");
}

var eventSources = {};

function refresh_calendars(calendars) {
	var unchecked = unchecked_calendar_ids();
	$.each(unchecked, function(index, id) {
		var eventSource = eventSources[id];
		if (eventSource != null) {
			$('.calendar').fullCalendar('removeEventSource', eventSource.url);
			eventSources[id] = null;
		};
	});

	$.each(calendars, function(index, calendar) {
		var eventSource = eventSources[calendar.cal_id];
		if (eventSource === undefined || eventSource === null) {
			$('.calendar').fullCalendar('addEventSource', calendar);
			eventSources[calendar.cal_id] = calendar;
		}
	});
}

function get_checked_calendars() {
	$.ajax({
		url: "/calendars",
		type: "POST",
		data: {
			ids: checked_calendar_ids()
		},
		success: function(data) {
			refresh_calendars(data);
		},
		error: function(data) {
			console.log("ERROR: " + data);
		}
	})
}

$(document).ready(function() {
	$('.calendar').fullCalendar({
		theme: true,
		weekMode: 'liquid'
	});
	get_checked_calendars();
})
