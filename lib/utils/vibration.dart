import 'package:save_money/logger/log.dart';
import 'package:vibration/vibration.dart';

Future<void> vibrate({int? duration}) async {
  try {
    if (await Vibration.hasCustomVibrationsSupport()) {
      Vibration.vibrate(duration: duration ?? 10);
    } else if (await Vibration.hasVibrator()) {
      log("has vibrator");
      Vibration.vibrate();
    } else {
      log("No vibration available");
    }
  } catch (e) {
    logError(e.toString());
  }
}
