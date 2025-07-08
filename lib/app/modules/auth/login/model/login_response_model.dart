class LoginResponseModel {
  LoginResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json){
    return LoginResponseModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.accessToken,
  });

  final String? accessToken;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      accessToken: json["accessToken"],
    );
  }

}
