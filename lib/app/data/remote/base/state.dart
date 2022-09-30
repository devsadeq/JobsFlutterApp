import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class State<T> with _$State<T> {
  const factory State.idle() = Idle<T>;

  const factory State.loading() = Loading<T>;

  const factory State.success({@required T? data}) = Success<T>;

  const factory State.failure({@required String? reason}) = Failure<T>;

// T? toData() => (this is Success) ? (this as Success).data : null;
}
