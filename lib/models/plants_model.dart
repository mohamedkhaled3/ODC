class PlantsModel {
  String? type = "";
  String? message = "";
  List<Data>? data = [];

  PlantsModel({this.type, this.message, this.data});

  PlantsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data?.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? plantId = "";
  String? name = "";
  String? description = "";
  String? imageUrl = "";
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  Data(
      {this.plantId,
      this.name,
      this.description,
      this.imageUrl,
      this.waterCapacity,
      this.sunLight,
      this.temperature});

  Data.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    waterCapacity = json['waterCapacity'];
    imageUrl = json['imageUrl'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plantId'] = plantId;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['waterCapacity'] = waterCapacity;
    data['sunLight'] = sunLight;
    data['temperature'] = temperature;
    return data;
  }
}
