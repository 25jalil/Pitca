$(function () {
  $('#calendar').fullCalendar({

    customButtons: {
      myCustomButton: {
        text: 'my events',
        click: function() {
          $('#calendar').fullCalendar('removeEvents');
          $('#calendar').fullCalendar('addEventSource', '/my_events.json');
          $('#calendar').fullCalendar('rerenderEvents' );
        }
      },
      allCustomButton: {
        text: 'all events',
        click: function() {
          $('#calendar').fullCalendar('removeEvents');
          $('#calendar').fullCalendar('addEventSource', '/events.json');
          $('#calendar').fullCalendar('rerenderEvents' );
        }
      }
    },

    header: {
      left: 'title',
      right: 'allCustomButton, myCustomButton, today, prev, next'
    },

    buttonText: {
      today: "Today"
    },
    selectable: true,
    selectHelper: true,
    editable: true,
    eventLimit: true,
    events: '/store_menus.json',
    eventClick: function(menu) {
      menu.url
    }
  });
});