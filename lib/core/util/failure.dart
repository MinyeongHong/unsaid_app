import 'package:unsaid_app/core/util/log.dart';

class Failure {
  final String message;
  final Object error;

  Failure(
    this.message,
    this.error,
  ) {
    errorLog(this.message, this.error);
  }
}
