import '../../base/idto.dart';

List<JobOutDto> jobsFromJson(List<dynamic> list) =>
    List<JobOutDto>.from(list.map((x) => JobOutDto.fromJson(x)));

class JobOutDto implements IDto {
  JobOutDto({
    this.id,
    this.company,
    this.position,
    this.employmentType,
    this.description,
    this.location,
    this.workplace,
    this.createdAt,
  });

  JobOutDto.fromJson(dynamic json) {
    id = json['id'];
    company =
        json['company'] != null ? CompanyBrief.fromJson(json['company']) : null;
    position = json['position'];
    employmentType = json['employment_type'];
    description = json['description'];
    location = json['location'];
    workplace = json['workplace'];
    createdAt = json['created_at'];
  }

  String? id;
  CompanyBrief? company;
  dynamic position;
  dynamic employmentType;
  String? description;
  dynamic location;
  dynamic workplace;
  String? createdAt;

  JobOutDto copyWith({
    String? id,
    CompanyBrief? company,
    dynamic position,
    dynamic employmentType,
    String? description,
    dynamic location,
    dynamic workplace,
    String? created,
  }) =>
      JobOutDto(
        id: id ?? this.id,
        company: company ?? this.company,
        position: position ?? this.position,
        employmentType: employmentType ?? this.employmentType,
        description: description ?? this.description,
        location: location ?? this.location,
        workplace: workplace ?? this.workplace,
        createdAt: created ?? this.createdAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (company != null) {
      map['company'] = company?.toJson();
    }
    map['position'] = position;
    map['employment_type'] = employmentType;
    map['description'] = description;
    map['location'] = location;
    map['workplace'] = workplace;
    map['created_at'] = createdAt;
    return map;
  }
}

class CompanyBrief {
  CompanyBrief({
    this.id,
    this.name,
    this.image,
  });

  CompanyBrief.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  String? id;
  String? name;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }
}
