class CountriesResponseModel {
  bool? status;
  List<DataCountriesResponseModel>? data;

  CountriesResponseModel({this.status, this.data});

  CountriesResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataCountriesResponseModel>[];
      json['data'].forEach((v) {
        data!.add(DataCountriesResponseModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataCountriesResponseModel {
  int? id;
  String? name;
  String? imageUrl;

  DataCountriesResponseModel({this.id, this.name, this.imageUrl});

  DataCountriesResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_url'] = imageUrl;
    return data;
  }
}
