import 'package:save_money/logger/log.dart';

class DayManager {

  int getCurrentTimeStampInSec () {
    try {
      DateTime now = DateTime.now();
      return now.millisecondsSinceEpoch ~/ 1000;
      
    } catch (e) {
      return 0;
      
    }
  }
  int getCurrentTimeStampInMilSec() {
    try {
      DateTime now = DateTime.now();
      return now.millisecondsSinceEpoch;
      
    } catch (e) {
      return 0;
      
    }
  }
  String getCurrentYMD() {
    try {
    DateTime now = DateTime.now();
    final year = now.year.toString();
    final month = now.month.toString().padLeft(2, "0");
    final day = now.day.toString().padLeft(2, "0");
    return "$year-$month-$day";
   } catch (e) {
    logError(e.toString());
    return "";
      
    }
  }
  
}