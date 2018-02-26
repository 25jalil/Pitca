$(function () {
  $('#calendar').fullCalendar({

    header: {
      left: 'title',
      right: 'prev, next'
    },

    selectable: true,
    selectHelper: true,
    editable: true,
    eventLimit: true,
    events: '/events.json',
    eventClick: function(menu) {
      menu.url
    }
  });
});
