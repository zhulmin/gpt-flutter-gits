import 'package:in_app_review/in_app_review.dart';

class Review {


// Use this after a user has experienced your app for long enough to provide useful feedback, e.g., after the completion of a game level or after a few days.
// Use this sparingly otherwise no pop up will appear.
  static launch() async {
    
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }

  }
}
