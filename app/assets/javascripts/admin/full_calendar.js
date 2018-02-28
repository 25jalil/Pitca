$(function () {
  $('#admin_calendar').fullCalendar({

    customButtons: {
      myCustomButton: {
        text: 'Orders store',
        click: function() {
          $('#admin_calendar').fullCalendar('removeEvents');
          $('#admin_calendar').fullCalendar('addEventSource', '/admin/all_orders.json');
          $('#admin_calendar').fullCalendar('rerenderEvents' );
        }
      },
      allCustomButton: {
        text: 'Menus store',
        click: function() {
          $('#admin_calendar').fullCalendar('removeEvents');
          $('#admin_calendar').fullCalendar('addEventSource', '/admin/menus.json');
          $('#admin_calendar').fullCalendar('rerenderEvents' );
        }
      }
    },

    header: {
      left: 'title',
      right: 'allCustomButton, myCustomButton, today, prev, next'
    },
    selectable: true,
    selectHelper: true,
    editable: true,
    eventLimit: true,
    events: '/admin/all_orders.json',
    eventClick: function(menu) {
      menu.url
    }
  });
});
