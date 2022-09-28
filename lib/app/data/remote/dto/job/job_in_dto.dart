import '../../base/idto.dart';

class JobInDto implements IDto {
  JobInDto({
    this.companyId,
    this.position,
    this.employmentType,
    this.description,
    this.location,
    this.workplace,
  });

  JobInDto.fromJson(dynamic json) {
    companyId = json['company_id'];
    position = json['position'];
    employmentType = json['employment_type'];
    description = json['description'];
    location = json['location'];
    workplace = json['workplace'];
  }

  String? companyId;
  String? position;
  String? employmentType;
  String? description;
  String? location;
  String? workplace;

  JobInDto copyWith({
    String? companyId,
    String? position,
    String? employmentType,
    String? description,
    String? location,
    String? workplace,
  }) =>
      JobInDto(
        companyId: companyId ?? this.companyId,
        position: position ?? this.position,
        employmentType: employmentType ?? this.employmentType,
        description: description ?? this.description,
        location: location ?? this.location,
        workplace: workplace ?? this.workplace,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_id'] = companyId;
    map['position'] = position;
    map['employment_type'] = employmentType;
    map['description'] = description;
    map['location'] = location;
    map['workplace'] = workplace;
    return map;
  }
}
