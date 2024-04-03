class PricingResponseModel {
  bool? status;
  DataPricingResponseModel? data;

  PricingResponseModel({this.status, this.data});

  PricingResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? DataPricingResponseModel.fromJson(json['data'])
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

class DataPricingResponseModel {
  List<PricingCountries>? countries;

  DataPricingResponseModel({this.countries});

  DataPricingResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <PricingCountries>[];
      json['countries'].forEach((v) {
        countries!.add(PricingCountries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (countries != null) {
      data['countries'] = countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PricingCountries {
  String? name;
  String? code;
  List<Packages>? packages;

  PricingCountries({this.name, this.code, this.packages});

  PricingCountries.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    if (packages != null) {
      data['packages'] = packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Packages {
  String? id;
  String? name;
  String? price;
  num? dataQuantity;
  String? dataUnit;
  int? packageValidity;
  String? packageValidityUnit;

  Packages(
      {this.id,
      this.name,
      this.price,
      this.dataQuantity,
      this.dataUnit,
      this.packageValidity,
      this.packageValidityUnit});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    dataQuantity = json['data_quantity'];
    dataUnit = json['data_unit'];
    packageValidity = json['package_validity'];
    packageValidityUnit = json['package_validity_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['data_quantity'] = dataQuantity;
    data['data_unit'] = dataUnit;
    data['package_validity'] = packageValidity;
    data['package_validity_unit'] = packageValidityUnit;
    return data;
  }
}
//