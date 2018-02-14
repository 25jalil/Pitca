$(document).ready(function() {
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
        today: "Сегодня"
      },
      monthNames: ['Январь','Февраль','Март','Апрель','Май','Июнь','Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь'],
      dayNamesShort: ["ВС","ПН","ВТ","СР","ЧТ","ПТ","СБ"],
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      events: '/events.json',
      eventClick: function(event) {
        event.url
      }
    });
  });

$(document).on('turbolinks:load', calendar);