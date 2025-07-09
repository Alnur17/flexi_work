class RegistrationResponseModel {
  var success;
  var statusCode;
  var message;
  RegistrationResponse? data;

  RegistrationResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new RegistrationResponse.fromJson(json['data']) : null;
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

class RegistrationResponse {
  User? user;
  OtpToken? otpToken;

  RegistrationResponse({this.user, this.otpToken});

  RegistrationResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    otpToken = json['otpToken'] != null
        ? new OtpToken.fromJson(json['otpToken'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.otpToken != null) {
      data['otpToken'] = this.otpToken!.toJson();
    }
    return data;
  }
}

class User {
  var sId;
  var id;
  var name;
  var email;
  var photoUrl;
  var contactNumber;

  User({
    this.sId,
    this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.contactNumber,
  });

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    contactNumber = json['contactNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['contactNumber'] = this.contactNumber;
    return data;
  }
}

class OtpToken {
  var token;

  OtpToken({this.token});

  OtpToken.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
