import 'dart:developer';

void routeLog(String message) {
  log(
    message,
    name: 'route',
  );
}

void dialogLog(String message) {
  log(
    message,
    name: 'dialog',
  );
}

void sheetLog(String message) {
  log(
    message,
    name: 'sheet',
  );
}

void errorLog(String message, Object error) {
  log(
    message,
    name: 'error',
    error: error.toString(),
  );
}
