import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:unsaid_app/core/util/firebase.dart';
import 'package:unsaid_app/core/util/log.dart';

Future<void> setAnalyticsUserId() async {
  try {
    await FirebaseAnalytics.instance.setUserId(
      id: currentUid,
    );
  } catch (e) {
    errorLog('setAnalyticsUserId', e);
  }
}

void analyticsLogEvent(
  String name, {
  Map<String, Object>? parameters,
}) async {
  try {
    if (kDebugMode) return;

    if (parameters == null) {
      parameters = {};
    }

    if (currentUid != null) {
      parameters.addAll({
        'uid': currentUid!,
      });
    }

    if (parameters.isEmpty) {
      parameters = null;
    }

    await FirebaseAnalytics.instance.logEvent(
      name: name,
      parameters: parameters,
    );
  } catch (e) {
    errorLog('analyticsLogEvent', e);
  }
}
