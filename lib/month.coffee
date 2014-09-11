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
      weekGroup.unshift null while weekGroup.length < 7
    daysByWeek
  else
    days

module.exports = {buildMonth}
