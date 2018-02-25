$(function () {
  $('#admin_calendar').fullCalendar({

    header: {
      left: 'title',
      right: 'prev, next'
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