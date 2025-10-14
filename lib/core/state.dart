import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class State<T> with _$State<T> {
  const State._();

  const factory State.initial() = _Initial<T>;

  const factory State.loading() = _Loading<T>;

  const factory State.success(T? data) = _Success<T>;

  const factory State.error(Exception exception) = _Error<T>;

  bool get isInitial => maybeWhen(initial: () => true, orElse: () => false);

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);

  bool get isSuccess => maybeWhen(success: (_) => true, orElse: () => false);

  bool get isError => maybeWhen(error: (_) => true, orElse: () => false);

  T? get data => maybeWhen(success: (data) => data, orElse: () => null);
}
