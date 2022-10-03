import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
abstract class Status<T> with _$State<T> {
  const factory Status.idle() = Idle<T>;

  const factory Status.loading() = Loading<T>;

  const factory Status.success({@required T? data}) = Success<T>;

  const factory Status.failure({@required String? reason}) = Failure<T>;
}
