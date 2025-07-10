class ProfileResponseModel {
  var success;
  var statusCode;
  var message;
  ProfileResponse? data;

  ProfileResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new ProfileResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileResponse {
  var sId;
  var name;
  var email;
  var contactNumber;
  var photoUrl;
  var jobTitle;
  var status;
  var avgRating;
  var ratingCount;
  var createdAt;
  var updatedAt;

  ProfileResponse({
    this.sId,
    this.name,
    this.email,
    this.contactNumber,
    this.photoUrl,
    this.jobTitle,
    this.status,
    this.avgRating,
    this.ratingCount,
    this.createdAt,
    this.updatedAt,
  });

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    contactNumber = json['contactNumber'];
    photoUrl = json['photoUrl'];
    jobTitle = json['jobTitle'];
    status = json['status'];
    avgRating = json['avgRating'];
    ratingCount = json['ratingCount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['contactNumber'] = this.contactNumber;
    data['photoUrl'] = this.photoUrl;
    data['jobTitle'] = this.jobTitle;
    data['status'] = this.status;
    data['avgRating'] = this.avgRating;
    data['ratingCount'] = this.ratingCount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
