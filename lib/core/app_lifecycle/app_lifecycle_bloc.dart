import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/common.dart';
import 'package:unsaid_app/core/util/date.dart';
import 'package:unsaid_app/core/util/log.dart';

part 'app_lifecycle_bloc.freezed.dart';
part 'app_lifecycle_event.dart';

class AppLifecycleBloc extends Bloc<AppLifecycleEvent, dynamic> {
  AppLifecycleBloc() : super(null) {
    on<_Fetch>(_fetch);
  }

  void _fetch(_Fetch _fetch, _) {
    try {
      final DateTime? minuteAppDate = DateTime.tryParse(box.get('minute_app_date') ?? '');

      if (_fetch.state == 'start') {
        box.put('minute_app_date', nowDate.toIso8601String());
        box.put('hour_app_date', nowDate.toIso8601String());
        box.put('day_app_date', nowDate.toIso8601String());

        setAnalyticsUserId();
      } else if (_fetch.state == 'resume') {
        if (minuteAppDate != null) {
          final int inMinutes = nowDate.difference(minuteAppDate).inMinutes;

          if (inMinutes > 0) {
            //  BlocProvider.of<FirebaseMessagingBloc>(context).add(FirebaseMessagingEvent.fetch());
          }
        }

        final DateTime? hourAppDate = DateTime.tryParse(box.get('hour_app_date') ?? '');

        if (hourAppDate != null) {
          final int inHours = nowDate.difference(hourAppDate).inHours;

          if (inHours > 0) {
            box.put('hour_app_date', nowDate.toIso8601String());
          }
        }

        final DateTime? dayAppDate = DateTime.tryParse(box.get('day_app_date') ?? '');

        if (dayAppDate != null) {
          final DateTime midDate = getMidDate(dayAppDate);

          final int inDays = nowMidDate.difference(midDate).inDays;

          if (inDays > 0) {
            box.put('day_app_date', nowDate.toIso8601String());
          }
        }
      } else if (_fetch.state == 'pause') {
        if (minuteAppDate != null) {
          final int inMinutes = nowDate.difference(minuteAppDate).inMinutes;

          if (inMinutes > 0) {
            // BlocProvider.of<FirebaseMessagingBloc>(context).add(FirebaseMessagingEvent.close());
          }
        }
      }
    } catch (e) {
      errorLog('AppLifecycleBloc', e);
    }
  }
}
