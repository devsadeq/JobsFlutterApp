import '../../base/idto.dart';

class CustomerProfileOutDto implements IDto {
  CustomerProfileOutDto({
    this.id,
    this.name,
    this.phone,
    this.education,
    this.workExperience,
    this.description,
    this.address,
    this.skills,
    this.language,
    this.jobTitle,
    this.image,
    this.cv,
  });

  CustomerProfileOutDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    if (json['education'] != null) {
      education = [];
      json['education'].forEach((v) {
        education?.add(Education.fromJson(v));
      });
    }
    if (json['work_experience'] != null) {
      workExperience = [];
      json['work_experience'].forEach((v) {
        workExperience?.add(WorkExperience.fromJson(v));
      });
    }
    description = json['description'];
    address = json['address'];
    skills = json['skills'] != null ? json['skills'].cast<String>() : [];
    language = json['language'] != null ? json['language'].cast<String>() : [];
    jobTitle = json['job_title'];
    image = json['image'];
    cv = json['cv'];
  }

  String? id;
  String? name;
  String? phone;
  List<Education>? education;
  List<WorkExperience>? workExperience;
  String? description;
  dynamic address;
  List<String>? skills;
  List<String>? language;
  String? jobTitle;
  String? image;
  String? cv;

  CustomerProfileOutDto copyWith({
    String? id,
    String? name,
    String? phone,
    List<Education>? education,
    List<WorkExperience>? workExperience,
    String? description,
    dynamic address,
    List<String>? skills,
    List<String>? language,
    String? jobTitle,
    String? image,
    String? cv,
  }) =>
      CustomerProfileOutDto(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        education: education ?? this.education,
        workExperience: workExperience ?? this.workExperience,
        description: description ?? this.description,
        address: address ?? this.address,
        skills: skills ?? this.skills,
        language: language ?? this.language,
        jobTitle: jobTitle ?? this.jobTitle,
        image: image ?? this.image,
        cv: cv ?? this.cv,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    if (education != null) {
      map['education'] = education?.map((v) => v.toJson()).toList();
    }
    if (workExperience != null) {
      map['work_experience'] = workExperience?.map((v) => v.toJson()).toList();
    }
    map['description'] = description;
    map['address'] = address;
    map['skills'] = skills;
    map['language'] = language;
    map['job_title'] = jobTitle;
    map['image'] = image;
    map['cv'] = cv;
    return map;
  }
}

class WorkExperience {
  WorkExperience({
    this.id,
    this.customerId,
    this.title,
    this.companyWorkedFor,
    this.startDate,
    this.endDate,
  });

  WorkExperience.fromJson(dynamic json) {
    id = json['id'];
    customerId = json['customer_id'];
    title = json['title'];
    companyWorkedFor = json['company_worked_for'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  String? id;
  String? customerId;
  String? title;
  String? companyWorkedFor;
  String? startDate;
  String? endDate;

  WorkExperience copyWith({
    String? id,
    String? customerId,
    String? title,
    String? companyWorkedFor,
    String? startDate,
    String? endDate,
  }) =>
      WorkExperience(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        title: title ?? this.title,
        companyWorkedFor: companyWorkedFor ?? this.companyWorkedFor,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['customer_id'] = customerId;
    map['title'] = title;
    map['company_worked_for'] = companyWorkedFor;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    return map;
  }
}

class Education {
  Education({
    this.id,
    this.customerId,
    this.school,
    this.degree,
    this.startDate,
    this.endDate,
  });

  Education.fromJson(dynamic json) {
    id = json['id'];
    customerId = json['customer_id'];
    school = json['school'];
    degree = json['degree'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  String? id;
  String? customerId;
  String? school;
  String? degree;
  String? startDate;
  String? endDate;

  Education copyWith({
    String? id,
    String? customerId,
    String? school,
    String? degree,
    String? startDate,
    String? endDate,
  }) =>
      Education(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        school: school ?? this.school,
        degree: degree ?? this.degree,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['customer_id'] = customerId;
    map['school'] = school;
    map['degree'] = degree;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    return map;
  }
}
