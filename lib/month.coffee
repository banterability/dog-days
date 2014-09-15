{groupBy} = require 'underscore'
moment = require 'moment'

buildDay = (year, month, day) ->
  {date: new Date(year, month, day)}

buildMonth = (month, year) ->
  now = new Date()
  month = month or now.getMonth()
  year = year or now.getFullYear()

  totalDays = moment(new Date(year, month, 1)).daysInMonth()

  buildDay(year, month, day) for day in [1..totalDays]

module.exports = {buildMonth}
