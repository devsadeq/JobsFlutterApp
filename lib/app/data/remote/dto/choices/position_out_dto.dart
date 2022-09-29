class PositionOutDto {
  PositionOutDto({
    this.jobTitle,
  });

  PositionOutDto.fromJson(dynamic json) {
    jobTitle = json['job_title'];
  }

  String? jobTitle;

  PositionOutDto copyWith({
    String? jobTitle,
  }) =>
      PositionOutDto(
        jobTitle: jobTitle ?? this.jobTitle,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['job_title'] = jobTitle;
    return map;
  }
}
