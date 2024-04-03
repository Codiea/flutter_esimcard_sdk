import '../others/meta_model.dart';

class PackagesByCountryResponseModel {
  bool? status;
  Meta? meta;
  List<DataPackagesByCountryResponseModel>? data;

  PackagesByCountryResponseModel({this.status, this.meta, this.data});

  PackagesByCountryResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <DataPackagesByCountryResponseModel>[];
      json['data'].forEach((v) {
        data!.add(DataPackagesByCountryResponseModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataPackagesByCountryResponseModel {
  String? id;
  String? name;
  String? price;
  num? dataQuantity;
  String? dataUnit;
  num? voiceQuantity;
  String? voiceUnit;
  num? smsQuantity;
  int? packageValidity;
  String? packageValidityUnit;
  String? packageType;

  DataPackagesByCountryResponseModel(
      {this.id,
      this.name,
      this.price,
      this.dataQuantity,
      this.dataUnit,
      this.voiceQuantity,
      this.voiceUnit,
      this.smsQuantity,
      this.packageValidity,
      this.packageValidityUnit,
      this.packageType});

  DataPackagesByCountryResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    dataQuantity = json['data_quantity'];
    dataUnit = json['data_unit'];
    voiceQuantity = json['voice_quantity'];
    voiceUnit = json['voice_unit'];
    smsQuantity = json['sms_quantity'];
    packageValidity = json['package_validity'];
    packageValidityUnit = json['package_validity_unit'];
    packageType = json['package_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['data_quantity'] = dataQuantity;
    data['data_unit'] = dataUnit;
    data['voice_quantity'] = voiceQuantity;
    data['voice_unit'] = voiceUnit;
    data['sms_quantity'] = smsQuantity;
    data['package_validity'] = packageValidity;
    data['package_validity_unit'] = packageValidityUnit;
    data['package_type'] = packageType;
    return data;
  }
}
