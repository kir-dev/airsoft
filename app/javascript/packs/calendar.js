import '../../../app/javascript/stylesheets/_variables.scss'

const commonCalendarOptions = {
  plugins: ['interaction', 'timeGrid', 'dayGrid'],
  views: {
    timeGridOneDay: {
      type: 'timeGrid',
      duration: { days: 1 },
      buttonText: 'nap',
      slotLabelFormat: {
        hour: 'numeric',
        minute: '2-digit',
        omitZeroMinute: true,
        meridiem: 'short'
      },
      nowIndicator: true
    }
  },
  buttonText: {
    today: 'ma',
    month: 'hónap',
    week: 'hét',
  },
  nowIndicator: true,
  locale: 'hu',
  selectable: true,
  eventColor: '#426145', //primary
  eventBorderColor: '#2f5e4e', //secondary
  eventClick: (calEvent) =>
    console.log("event details screen")
}



function calendarWebView(events, calendarEl) {
  const calendar = new FullCalendar.Calendar(calendarEl, {
    ...commonCalendarOptions,
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'timeGridOneDay,timeGridWeek,dayGridMonth',
    },
    defaultView: 'timeGridWeek',
    events: events,
    select: (info) => {
      if (info.view.type === 'dayGridMonth') {
        calendar.gotoDate(info.start)
        calendar.changeView('timeGridOneDay')
      } else {
        console.log("navigate to this event");
      }
    }
  })
  return calendar;
}

function calendarMobileView(events, calendarEl) {
  const calendar = new FullCalendar.Calendar(calendarEl, {
    ...commonCalendarOptions,
    header: {
      left: 'title',
      center: '',
      right: 'timeGridOneDay,timeGridWeek,dayGridMonth'
    },
    defaultView: 'timeGridOneDay',
    customButtons: {
      prevWeek: {
        text: '-7',
        click: () => {
          calendar.incrementDate({
            days: -7
          })
        }
      },
      nextWeek: {
        text: '+7',
        click: () => {
          calendar.incrementDate({
            days: 7
          })
        }
      }
    },
    footer: {
      center: 'prevWeek,prev,today,next,nextWeek'
    },
    titleFormat: {
      year: 'numeric',
      month: 'short',
      weekday: 'short',
      day: 'numeric'
    },
    aspectRatio: 0.75,
    events: events,
    select: (info) => {
      if (info.view.type === 'dayGridMonth') {
        calendar.gotoDate(info.start)
        calendar.changeView('timeGridOneDay')
      }
      else {
        console.log("navigate to this event");
      }
    }
  })
  return calendar;
}


document.addEventListener('DOMContentLoaded', () => {
  var calendarEl = document.getElementById('calendar')

  // TODO fetch events to pass it to the calendarviews
  var events =[];
  if (window.innerWidth < 768) {
    console.log("kezdoben mobilos");
    calendarMobileView(events, calendarEl).render();
  }
  else {
    console.log("kezdoben webes");
    calendarWebView(events, calendarEl).render();
  }

})