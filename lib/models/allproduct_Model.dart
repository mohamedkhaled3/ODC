class AllProducts {
  String? _type;
  String? _message;
  Data? _data;

  AllProducts({String? type, String? message, Data? data}) {
    if (type != null) {
      this._type = type;
    }
    if (message != null) {
      this._message = message;
    }
    if (data != null) {
      this._data = data;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  String? get message => _message;
  set message(String? message) => _message = message;
  Data? get data => _data;
  set data(Data? data) => _data = data;

  AllProducts.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Plants>? _plants;
  List<Seeds>? _seeds;
  List<Tools>? _tools;

  Data({List<Plants>? plants, List<Seeds>? seeds, List<Tools>? tools}) {
    if (plants != null) {
      this._plants = plants;
    }
    if (seeds != null) {
      this._seeds = seeds;
    }
    if (tools != null) {
      this._tools = tools;
    }
  }

  List<Plants>? get plants => _plants;
  set plants(List<Plants>? plants) => _plants = plants;
  List<Seeds>? get seeds => _seeds;
  set seeds(List<Seeds>? seeds) => _seeds = seeds;
  List<Tools>? get tools => _tools;
  set tools(List<Tools>? tools) => _tools = tools;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['plants'] != null) {
      _plants = <Plants>[];
      json['plants'].forEach((v) {
        _plants!.add(new Plants.fromJson(v));
      });
    }
    if (json['seeds'] != null) {
      _seeds = <Seeds>[];
      json['seeds'].forEach((v) {
        _seeds!.add(new Seeds.fromJson(v));
      });
    }
    if (json['tools'] != null) {
      _tools = <Tools>[];
      json['tools'].forEach((v) {
        _tools!.add(new Tools.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._plants != null) {
      data['plants'] = this._plants!.map((v) => v.toJson()).toList();
    }
    if (this._seeds != null) {
      data['seeds'] = this._seeds!.map((v) => v.toJson()).toList();
    }
    if (this._tools != null) {
      data['tools'] = this._tools!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plants {
  String? _plantId;
  String? _name;
  String? _description;
  String? _imageUrl;
  int? _waterCapacity;
  int? _sunLight;
  int? _temperature;

  Plants(
      {String? plantId,
      String? name,
      String? description,
      String? imageUrl,
      int? waterCapacity,
      int? sunLight,
      int? temperature}) {
    if (plantId != null) {
      this._plantId = plantId;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
    if (imageUrl != null) {
      this._imageUrl = imageUrl;
    }
    if (waterCapacity != null) {
      this._waterCapacity = waterCapacity;
    }
    if (sunLight != null) {
      this._sunLight = sunLight;
    }
    if (temperature != null) {
      this._temperature = temperature;
    }
  }

  String? get plantId => _plantId;
  set plantId(String? plantId) => _plantId = plantId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;
  int? get waterCapacity => _waterCapacity;
  set waterCapacity(int? waterCapacity) => _waterCapacity = waterCapacity;
  int? get sunLight => _sunLight;
  set sunLight(int? sunLight) => _sunLight = sunLight;
  int? get temperature => _temperature;
  set temperature(int? temperature) => _temperature = temperature;

  Plants.fromJson(Map<String, dynamic> json) {
    _plantId = json['plantId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
    _waterCapacity = json['waterCapacity'];
    _sunLight = json['sunLight'];
    _temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plantId'] = this._plantId;
    data['name'] = this._name;
    data['description'] = this._description;
    data['imageUrl'] = this._imageUrl;
    data['waterCapacity'] = this._waterCapacity;
    data['sunLight'] = this._sunLight;
    data['temperature'] = this._temperature;
    return data;
  }
}

class Seeds {
  String? _seedId;
  String? _name;
  String? _description;
  String? _imageUrl;

  Seeds({String? seedId, String? name, String? description, String? imageUrl}) {
    if (seedId != null) {
      this._seedId = seedId;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
    if (imageUrl != null) {
      this._imageUrl = imageUrl;
    }
  }

  String? get seedId => _seedId;
  set seedId(String? seedId) => _seedId = seedId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;

  Seeds.fromJson(Map<String, dynamic> json) {
    _seedId = json['seedId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seedId'] = this._seedId;
    data['name'] = this._name;
    data['description'] = this._description;
    data['imageUrl'] = this._imageUrl;
    return data;
  }
}

class Tools {
  String? _toolId;
  String? _name;
  String? _description;
  String? _imageUrl;

  Tools({String? toolId, String? name, String? description, String? imageUrl}) {
    if (toolId != null) {
      this._toolId = toolId;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
    if (imageUrl != null) {
      this._imageUrl = imageUrl;
    }
  }

  String? get toolId => _toolId;
  set toolId(String? toolId) => _toolId = toolId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;

  Tools.fromJson(Map<String, dynamic> json) {
    _toolId = json['toolId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['toolId'] = this._toolId;
    data['name'] = this._name;
    data['description'] = this._description;
    data['imageUrl'] = this._imageUrl;
    return data;
  }
}
