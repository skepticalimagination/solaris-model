# TODO: is the correct date January 1, 2000, 11:58:55.816 UTC?
# https://en.wikipedia.org/wiki/Equinox_(celestial_coordinates)#J2000.0
export J2000 = new Date(Date.UTC 2000, 0, 1, 12, 0, 0)
export dayInSeconds = 86400
export averageYearInDays = 365.24

export parse = (str) -> new Date(str + 'T12:00:00Z')
export addMilliseconds = (date, ms) -> date.getTime() + ms
export addDays = (date, days) ->
  result = new Date(date)
  result.setDate(result.getDate() + days)
  result
export daysBetween = (a, b) -> (a - b) / 1000 / dayInSeconds
export centuriesBetween = (a, b) -> (a - b) / 1000 / dayInSeconds / averageYearInDays / 100

# used to display periods in user-friendly format
export secondsToDays = (secs) -> secs / dayInSeconds

export default {J2000, dayInSeconds, averageYearInDays, parse, addMilliseconds, addDays, daysBetween, centuriesBetween, secondsToDays}
