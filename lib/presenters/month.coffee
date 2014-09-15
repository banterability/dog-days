moment = require 'moment'
{groupBy, isNull} = require 'underscore'

presentMonth = (days) ->
  output = []
  weeks = splitByWeek(days)
  for weekNumber, weekData of weeks
    weekOutput = []
    for day in weekData
      weekOutput.push extractFields(day)
    output.push weekOutput
  output

splitByWeek = (days) ->
  daysByWeek = groupBy days, (thisDay) -> moment(thisDay.date).week()
  for weekNumber, weekGroup of daysByWeek
    weekGroup = padWeek(weekGroup)
  daysByWeek

padWeek = (week) ->
  if week.length < 7
    directionToPad = if week[0].date.getDay() is 0 then 'after' else 'before'
    while week.length < 7
      if directionToPad is 'after'
        week.push null
      else
        week.unshift null
  week

extractFields = (day) ->
  return {} if isNull(day)
  theDate = day.date
  {
    displayDate: theDate.getDate()
  }

module.exports = {presentMonth}
