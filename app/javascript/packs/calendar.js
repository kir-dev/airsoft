document.addEventListener('DOMContentLoaded', () => {
  var calendarEl = document.getElementById('calendar')
  var calendar = new FullCalendar.Calendar(calendarEl, {
    // TODO: make it responsive and use its API to fill it in with events
    initialView: 'dayGridMonth'
  })
  calendar.render()

})