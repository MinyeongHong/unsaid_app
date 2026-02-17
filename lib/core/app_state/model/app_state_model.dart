import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unsaid_app/core/app_state/bloc/app_state_bloc.dart';
import 'package:unsaid_app/core/app_state/widget/app_state_dialog.dart';
import 'package:unsaid_app/core/util/common.dart';
import 'package:unsaid_app/core/util/date.dart';
import 'package:unsaid_app/core/util/format.dart';
import 'package:unsaid_app/core/util/log.dart';

part 'app_state_model.freezed.dart';
part 'app_state_model.g.dart';

@freezed
abstract class AppState with _$AppState {
  const AppState._();
  const factory AppState(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'language') String language,
    @JsonKey(name: 'ios_app_version') String iosAppVersion,
    @JsonKey(name: 'android_app_version') String androidAppVersion,
    @JsonKey(name: 'update_title') String updateTitle,
    @JsonKey(name: 'maintenance_title') String maintenanceTitle,
    @JsonKey(name: 'maintenance_start_at') DateTime? maintenanceStartAt,
    @JsonKey(name: 'maintenance_end_at') DateTime? maintenanceEndAt,
    @JsonKey(defaultValue: '1.0.0') String packageInfoVersion,
    @JsonKey(defaultValue: false) bool hasDialog,
  ) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

  String get updateAppVersion => Platform.isIOS ? this.iosAppVersion : this.androidAppVersion;

  bool get isMaintenance => isContainDate(this.maintenanceStartAt, this.maintenanceEndAt);

  String getMaintenanceAtTitle() {
    String startAtTitle = '';

    if (this.maintenanceStartAt != null) {
      startAtTitle = '${formatDate(this.maintenanceStartAt!)}';
    }

    final String endAtTitle = '${formatDate(this.maintenanceEndAt!)}';

    return '$startAtTitle ~ $endAtTitle';
  }

  bool isUpdate() {
    bool isUpdate = false;

    final int packageInfoVersionToInt = int.parse(this.packageInfoVersion.replaceAll('.', ''));
    final int iosAppVersionToInt = int.parse(this.iosAppVersion.replaceAll('.', ''));
    final int androidAppVersionToInt = int.parse(this.androidAppVersion.replaceAll('.', ''));

    final int packageInfoVersionFirstNumber = int.parse(this.packageInfoVersion.toString()[0]);
    final int iosAppVersionFirstNumber = int.parse(this.iosAppVersion.toString()[0]);
    final int androidAppVersionFirstNumber = int.parse(this.androidAppVersion.toString()[0]);

    if (Platform.isIOS) {
      if (packageInfoVersionToInt < iosAppVersionToInt &&
          packageInfoVersionFirstNumber <= iosAppVersionFirstNumber) {
        isUpdate = true;
      }
    }

    if (Platform.isAndroid) {
      if (packageInfoVersionToInt < androidAppVersionToInt &&
          packageInfoVersionFirstNumber <= androidAppVersionFirstNumber) {
        isUpdate = true;
      }
    }

    return isUpdate;
  }

  void addDialog() {
    try {
      if (this.hasDialog) return;

      if (this.isUpdate()) {
        appUpdateDialog(appState: this);
      } else if (this.isMaintenance) {
        appMaintenanceDialog(
          appState: this,
        );
      }

      if (this.isUpdate() || this.isMaintenance) {
        BlocProvider.of<AppStateBloc>(context).add(
          AppStateEvent.update(),
        );
      }
    } catch (e) {
      errorLog('addDialog', e);
    }
  }
}
