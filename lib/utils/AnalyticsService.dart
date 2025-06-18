import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() => FirebaseAnalyticsObserver(analytics: _analytics);

  Future logScreens({String? name}) async {
    await _analytics.logScreenView(screenName: name);
  }

  Future logEvent(String name) async {
    await _analytics.logEvent(name: name, parameters: null);
  }
}
