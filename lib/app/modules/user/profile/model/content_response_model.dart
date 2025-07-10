class ContentResponseModel {
  var success;
  var statusCode;
  var message;
  Meta? meta;
  List<ContentResponse>? data;

  ContentResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  ContentResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <ContentResponse>[];
      json['data'].forEach((v) {
        data!.add(new ContentResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  var page;
  var limit;
  var total;
  var totalPage;

  Meta({this.page, this.limit, this.total, this.totalPage});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['totalPage'] = this.totalPage;
    return data;
  }
}

class ContentResponse {
  var sId;
  var aboutUs;
  var termsAndConditions;
  var privacyPolicy;
  var supports;
  var faq;
  var isDeleted;
  var createdBy;
  var createdAt;
  var updatedAt;

  ContentResponse({
    this.sId,
    this.aboutUs,
    this.termsAndConditions,
    this.privacyPolicy,
    this.supports,
    this.faq,
    this.isDeleted,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  ContentResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    aboutUs = json['aboutUs'];
    termsAndConditions = json['termsAndConditions'];
    privacyPolicy = json['privacyPolicy'];
    supports = json['supports'];
    faq = json['faq'];
    isDeleted = json['isDeleted'];
    createdBy = json['createdBy'] != null
        ? new CreatedBy.fromJson(json['createdBy'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['aboutUs'] = this.aboutUs;
    data['termsAndConditions'] = this.termsAndConditions;
    data['privacyPolicy'] = this.privacyPolicy;
    data['supports'] = this.supports;
    data['faq'] = this.faq;
    data['isDeleted'] = this.isDeleted;
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class CreatedBy {
  var sId;
  var name;
  var email;
  var contactNumber;
  var photoUrl;
  var status;

  CreatedBy({
    this.sId,
    this.name,
    this.email,
    this.contactNumber,
    this.photoUrl,
    this.status,
  });

  CreatedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    contactNumber = json['contactNumber'];
    photoUrl = json['photoUrl'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['contactNumber'] = this.contactNumber;
    data['photoUrl'] = this.photoUrl;
    data['status'] = this.status;
    return data;
  }
}
