{groupBy} = require 'underscore'
moment = require 'moment'

buildDay = (year, month, day) ->
  {date: new Date(year, month, day)}

buildMonth = (month, year, options={}) ->
  now = new Date()
  month = month or now.getMonth()
  year = year or now.getFullYear()

  totalDays = moment(new Date(year, month, 1)).daysInMonth()

  days = (buildDay(year, month, day) for day in [1..totalDays])
  if options.byWeek
    daysByWeek = groupBy days, (thisDay) -> moment(thisDay.date).week()
    for weekNumber, weekGroup of daysByWeek
      weekGroup = padWeek(weekGroup)
    daysByWeek
  else
    days

padWeek = (week) ->
  if week.length < 7
    directionToPad = if week[0].date.getDay() is 0 then 'after' else 'before'
    while week.length < 7
      if directionToPad is 'after'
        week.push null
      else
        week.unshift null
  week

module.exports = {buildMonth}
