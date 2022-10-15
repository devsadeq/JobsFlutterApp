import '../../base/idto.dart';

class ApplicationOutDto implements IDto {
  ApplicationOutDto({
    this.id,
    this.customer,
    this.job,
    this.whyApply,
  });

  ApplicationOutDto.fromJson(dynamic json) {
    id = json['id'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    job = json['job'] != null ? Job.fromJson(json['job']) : null;
    whyApply = json['why_apply'];
  }

  String? id;
  Customer? customer;
  Job? job;
  String? whyApply;

  ApplicationOutDto copyWith({
    String? id,
    Customer? customer,
    Job? job,
    String? whyApply,
  }) =>
      ApplicationOutDto(
        id: id ?? this.id,
        customer: customer ?? this.customer,
        job: job ?? this.job,
        whyApply: whyApply ?? this.whyApply,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (customer != null) {
      map['customer'] = customer?.toJson();
    }
    if (job != null) {
      map['job'] = job?.toJson();
    }
    map['why_apply'] = whyApply;
    return map;
  }
}

class Job {
  Job({
    this.id,
  });

  Job.fromJson(dynamic json) {
    id = json['id'];
  }

  String? id;

  Job copyWith({
    String? id,
  }) =>
      Job(
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    return map;
  }
}

class Customer {
  Customer({
    this.id,
    this.name,
    this.jobTitle,
    this.image,
  });

  Customer.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    jobTitle = json['job_title'];
    image = json['image'];
  }

  String? id;
  String? name;
  String? jobTitle;
  String? image;

  Customer copyWith({
    String? id,
    String? name,
    String? jobTitle,
    String? image,
  }) =>
      Customer(
        id: id ?? this.id,
        name: name ?? this.name,
        jobTitle: jobTitle ?? this.jobTitle,
        image: image ?? this.image,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['job_title'] = jobTitle;
    map['image'] = image;
    return map;
  }
}
