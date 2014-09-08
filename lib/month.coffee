moment = require 'moment'

buildMonth = (month, year) ->
  now = new Date()
  month = month or now.getMonth()
  year = year or now.getFullYear()

  totalDays = moment(new Date(year, month, 1)).daysInMonth()

  new Date(year, month, day) for day in [1..totalDays]

module.exports = {buildMonth}
