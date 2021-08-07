import 'dart:core';

import 'package:intl/intl.dart';

String determineGreeting() {
  var date = DateTime.now();
  DateFormat dateFormat = DateFormat('H');
  int currentHour = int.parse(dateFormat.format(date));
  if(currentHour >= 4 && currentHour < 12)
      return 'Good Morning,';
  else if(currentHour >= 12 && currentHour < 16)
      return 'Good Afternoon,';
  else
      return 'Good evening,';
}

String getDate() {
  var date = DateTime.now();
  DateFormat dateFormat = DateFormat('EEEE, MMMM d');
  String currentDate = dateFormat.format(date);
  return currentDate;
}