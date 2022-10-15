import '../../base/idto.dart';

class ApplicationInDto implements IDto {
  ApplicationInDto({
    this.customerId,
    this.jobId,
    this.whyApply,
  });

  ApplicationInDto.fromJson(dynamic json) {
    customerId = json['customer_id'];
    jobId = json['job_id'];
    whyApply = json['why_apply'];
  }

  String? customerId;
  String? jobId;
  String? whyApply;

  ApplicationInDto copyWith({
    String? customerId,
    String? jobId,
    String? whyApply,
  }) =>
      ApplicationInDto(
        customerId: customerId ?? this.customerId,
        jobId: jobId ?? this.jobId,
        whyApply: whyApply ?? this.whyApply,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customer_id'] = customerId;
    map['job_id'] = jobId;
    map['why_apply'] = whyApply;
    return map;
  }
}
