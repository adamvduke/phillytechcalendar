$(document).ready(function() {

    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    // page is now ready, initialize the calendar...
    $('.calendar').fullCalendar({
        // put your options and callbacks here
        header: {
            left: 'prev,next today',
            center: 'title',
            right: ''
        },
        editable: true,

        // set a list of events for testing
        events: [
        {
            title: 'All Day Event With a Realllllyyyyyyyyyyy Long name',
            start: new Date(y, m, 1)
        },
        {
            title: 'All Day Event',
            start: new Date(y, m, 15)
        },
        {
            title: 'All Day Event',
            start: new Date(y, m, 1)
        },
        {
            title: 'All Day Event',
            start: new Date(y, m, 10)
        },
        {
            title: 'All Day Event',
            start: new Date(y, m, 6)
        },

        {
            title: 'All Day Event',
            start: new Date(y, m, 31)
        },
        {
            title: 'All Day Event',
            start: new Date(y, m, 1)
        },
        {
            title: 'All Day Event',
            start: new Date(y, m, 1)
        },
        {
            title: 'All Day Event',
            start: new Date(y, m, 19)
        }
        ]
    })
});