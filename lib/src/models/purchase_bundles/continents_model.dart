class ContinentsResponseModel {
  bool? status;
  List<DataContinentsResponseModel>? data;

  ContinentsResponseModel({this.status, this.data});

  ContinentsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataContinentsResponseModel>[];
      json['data'].forEach((v) {
        data!.add(DataContinentsResponseModel.fromJson(v));
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

class DataContinentsResponseModel {
  int? id;
  String? name;
  String? code;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  DataContinentsResponseModel(
      {this.id,
      this.name,
      this.code,
      this.createdAt,
      this.updatedAt,
      this.imageUrl});

  DataContinentsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;
    return data;
  }
}
