class LoginModel {
  String? type;
  String? message;
  Data? data;
  LoginModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json["data"]) : null;
  }
}

class Data {
  UserData? userData;
  String? accessToken;
  String? refreshToken;
  Data(
    this.userData,
    this.refreshToken,
    this.accessToken,
  );
  Data.fromJson(Map<String, dynamic> json) {
    userData = json['user'] != null ? UserData.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}

class UserData {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;

  UserData(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.imageUrl,
    this.address,
    this.role,
  );

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
  }
}
