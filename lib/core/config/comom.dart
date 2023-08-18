import 'package:logger/logger.dart';

typedef StringCallback = void Function(String);

var logger = Logger(
      printer: PrettyPrinter(
          colors: true,
          printEmojis: true,
          printTime: false),
    );

logDev(data) {
  logger.d(data);
}

logError(data) {
  logger.e(data);
}

logNetwork(data) {
  logger.i(data);
}