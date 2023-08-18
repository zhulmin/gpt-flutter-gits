import 'package:vibration/vibration.dart';

class VibrationTool {
  static light() async {
    if (await Vibration.hasAmplitudeControl() == true &&
        await Vibration.hasCustomVibrationsSupport() == true) {
      Vibration.vibrate(amplitude: 50, duration: 100);
    } else {
      if (await Vibration.hasVibrator() == true) {
        Vibration.vibrate();
      }
    }
  }
}
