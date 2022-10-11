import '../../base/idto.dart';

class ToggleSaveOutDto implements IDto {
  ToggleSaveOutDto({
    this.message,
    this.saved,
  });

  ToggleSaveOutDto.fromJson(dynamic json) {
    message = json['message'];
    saved = json['saved'];
  }

  String? message;
  bool? saved;

  ToggleSaveOutDto copyWith({
    String? message,
    bool? saved,
  }) =>
      ToggleSaveOutDto(
        message: message ?? this.message,
        saved: saved ?? this.saved,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['saved'] = saved;
    return map;
  }
}
