$(function () {
  $('#admin_calendar').fullCalendar({

    customButtons: {
      firstCustomButton: {
        text: 'Orders store',
        click: function() {
          $('#admin_calendar').fullCalendar('removeEvents');
          $('#admin_calendar').fullCalendar('addEventSource', '/admin/all_orders.json');
          $('#admin_calendar').fullCalendar('rerenderEvents' );
        }
      },
      secondCustomButton: {
        text: 'Menus store',
        click: function() {
          $('#admin_calendar').fullCalendar('removeEvents');
          $('#admin_calendar').fullCalendar('addEventSource', '/admin/menus.json');
          $('#admin_calendar').fullCalendar('rerenderEvents' );
        }
      },
      thirdCustomButton: {
        text: 'Orders day',
        click: function() {
          $('#admin_calendar').fullCalendar('removeEvents');
          $('#admin_calendar').fullCalendar('addEventSource', '/admin/orders_day.json');
          $('#admin_calendar').fullCalendar('rerenderEvents' );
        }
      }
    },

    header: {
      left: 'title',
      right: 'firstCustomButton, secondCustomButton, thirdCustomButton, today, prev, next'
    },
    selectable: true,
    selectHelper: true,
    editable: true,
    displayEventTime: false,
    eventLimit: true,
    events: '/admin/all_orders.json',
    eventClick: function(menu) {
      menu.url
    }
  });
});
