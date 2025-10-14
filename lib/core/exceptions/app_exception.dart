import 'base_exception.dart';

/// Represents general application-level exceptions.
class AppException extends BaseException {
  final int? code;
  final dynamic details;

  AppException({required String message, this.code, this.details})
    : super(message);

  @override
  String toString() {
    final buffer = StringBuffer()
      ..writeln("AppException:")
      ..writeln("Message: $message");
    if (code != null) buffer.writeln("Code: $code");
    if (details != null) buffer.writeln("Details: $details");
    return buffer.toString();
  }
}
