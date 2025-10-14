import 'base_exception.dart';

class GenericException extends BaseException {
  GenericException({String message = "An unexpected error occurred."})
    : super(message);
}
