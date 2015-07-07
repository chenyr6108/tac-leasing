/*
 *  date.js gives JavaScript's date object a format() method.
 *  
 *  Written on 5/20/2008 by Robert Miller for Delphic Sage
 *  http://www.delphicsage.com/
*/

Date.prototype.format = function(format_str)
{
  var pad_number = function(n, c)
  {
    n = "" + n;
    while(n.length < c)
      n = "0" + n;
    return n;
  }
  
  var month_to_str =
  {
    0: "Jan",
    1: "Feb",
    2: "Mar",
    3: "Apr",
    4: "May",
    5: "Jun",
    6: "Jul",
    7: "Aug",
    8: "Sep",
    9: "Oct",
    10: "Nov",
    11: "Dec"
  };
  
  var month_to_full_str =
  {
    0: "January",
    1: "February",
    2: "March",
    3: "April",
    4: "May",
    5: "June",
    6: "July",
    7: "August",
    8: "September",
    9: "October",
    10: "November",
    11: "December"
  };
  
  var day_to_str =
  {
    0: "Sun",
    1: "Mon",
    2: "Tue",
    3: "Wed",
    4: "Thu",
    5: "Fri",
    6: "Sat"
  };
  
  var day_to_full_str =
  {
    0: "Sunday",
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday"
  };
  
  /*
   *  s		seconds
   *  ss	two-digit display
   *  
   *  m		minutes
   *  mm	two-digit display
   *  
   *  h		hours
   *  hh	two-digit display
   *  
   *  d		day of month
   *  dd	two-digit display
   *  
   *  D		numeric representation of day of week
   *  DDD	three letter abbreviation for day of week
   *  DDDD	full name of day of week
   *  
   *  M		numeric representation of month
   *  MM	two-digit display
   *  MMM	three letter abbreviation for month
   *  MMMM	full name of the month
   *  
   *  y		four-digit year
   *  
  */
  
  var result_str = format_str;
  
  /*
   *  The replacements are done in two passes so that they
   *  don't interfere with each other. If it wasn't done this
   *  way, replacing "D" with "Tuesday" puts another "y" into
   *  the string, which will be replaced with the year. We
   *  don't want "D" to become "Tuesda2008", so we first replace
   *  the "D" with "[day=#]" to avoid these conflicts.
  */
  
  result_str = result_str.replace("y", "[year=#]");
  
  result_str = result_str.replace("ss", "[sec=##]");
  result_str = result_str.replace("s", "[sec=#]");
  
  result_str = result_str.replace("mm", "[inute=##]");
  result_str = result_str.replace("m", "[inute=#]");
  
  result_str = result_str.replace("dd", "[ate=##]");
  result_str = result_str.replace("d", "[ate=#]");
  
  result_str = result_str.replace("DDDD", "[day=####]");
  result_str = result_str.replace("DDD", "[day=###]");
  result_str = result_str.replace("D", "[day=#]");
  
  result_str = result_str.replace("hh", "[our=##]");
  result_str = result_str.replace("h", "[our=#]");
  
  result_str = result_str.replace("MMMM", "[onth=####]");
  result_str = result_str.replace("MMM", "[onth=###]");
  result_str = result_str.replace("MM", "[onth=##]");
  result_str = result_str.replace("M", "[onth=#]");
  
  
  result_str = result_str.replace("[ate=##]", pad_number(this.getDate(), 2));
  result_str = result_str.replace("[ate=#]", this.getDate());
  
  var year = this.getYear();
  if(year < 100) year += 1900;
  
  result_str = result_str.replace("[year=#]", year);
  
  result_str = result_str.replace("[our=##]", pad_number(this.getHours(), 2));
  result_str = result_str.replace("[our=#]", this.getHours());
  
  result_str = result_str.replace("[inute=##]", pad_number(this.getMinutes(), 2));
  result_str = result_str.replace("[inute=#]", this.getMinutes());
  
  result_str = result_str.replace("[sec=##]", pad_number(this.getSeconds(), 2));
  result_str = result_str.replace("[sec=#]", this.getSeconds());
  
  result_str = result_str.replace("[onth=####]", month_to_full_str[this.getMonth()]);
  result_str = result_str.replace("[onth=###]", month_to_str[this.getMonth()]);
  result_str = result_str.replace("[onth=##]", pad_number(this.getMonth() + 1, 2));
  result_str = result_str.replace("[onth=#]", this.getMonth() + 1);
  
  result_str = result_str.replace("[day=####]", day_to_full_str[this.getDay()]);
  result_str = result_str.replace("[day=###]", day_to_str[this.getDay()]);
  result_str = result_str.replace("[day=#]", this.getDay());
  
  return result_str;
}