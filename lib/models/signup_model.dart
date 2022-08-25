class SignUpModel {
  String? type;
  String? message;
  Data? data;
  SignUpModel.fromJson(Map<String, dynamic> json) {
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
  String? firstMame;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;

  UserData(
    this.id,
    this.firstMame,
    this.lastName,
    this.email,
    this.imageUrl,
    this.address,
    this.role,
  );

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstMame = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
  }
}
