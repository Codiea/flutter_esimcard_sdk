import '../others/network_coverage_model.dart';

class PackageDetailResponseModel {
  bool? status;
  DataPackageDetailResponseModel? data;

  PackageDetailResponseModel({this.status, this.data});

  PackageDetailResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? DataPackageDetailResponseModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataPackageDetailResponseModel {
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
  List<RomaingCountries>? romaingCountries;

  DataPackageDetailResponseModel({
    this.id,
    this.name,
    this.price,
    this.dataQuantity,
    this.dataUnit,
    this.voiceQuantity,
    this.voiceUnit,
    this.smsQuantity,
    this.packageValidity,
    this.packageValidityUnit,
    this.romaingCountries,
  });

  DataPackageDetailResponseModel.fromJson(Map<String, dynamic> json) {
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
    if (json['romaing_countries'] != null) {
      romaingCountries = <RomaingCountries>[];
      json['romaing_countries'].forEach((v) {
        romaingCountries!.add(RomaingCountries.fromJson(v));
      });
    }
    // if (json['countries'] != null) {
    //   countries = <Countries>[];
    //   json['countries'].forEach((v) {
    //     countries!.add(new Countries.fromJson(v));
    //   });
    // }
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
    if (romaingCountries != null) {
      data['romaing_countries'] =
          romaingCountries!.map((v) => v.toJson()).toList();
    }
    // if (this.countries != null) {
    //   data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class RomaingCountries {
  int? id;
  String? name;
  String? imageUrl;
  List<NetworkCoverage>? networkCoverage;

  RomaingCountries({this.id, this.name, this.imageUrl, this.networkCoverage});

  RomaingCountries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    if (json['network_coverage'] != null) {
      networkCoverage = <NetworkCoverage>[];
      json['network_coverage'].forEach((v) {
        networkCoverage!.add(NetworkCoverage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_url'] = imageUrl;
    if (networkCoverage != null) {
      data['network_coverage'] =
          networkCoverage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
