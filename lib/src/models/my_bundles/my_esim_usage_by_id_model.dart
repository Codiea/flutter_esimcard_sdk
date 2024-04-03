class MyEsimUsageByIDResponseModel {
  bool? status;
  DataMyEsimUsageByIDResponseModel? data;

  MyEsimUsageByIDResponseModel({this.status, this.data});

  MyEsimUsageByIDResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? DataMyEsimUsageByIDResponseModel.fromJson(json['data'])
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

class DataMyEsimUsageByIDResponseModel {
  num? initialDataQuantity;
  String? initialDataUnit;
  num? remDataQuantity;
  String? remDataUnit;

  DataMyEsimUsageByIDResponseModel({
    this.initialDataQuantity,
    this.initialDataUnit,
    this.remDataQuantity,
    this.remDataUnit,
  });

  DataMyEsimUsageByIDResponseModel.fromJson(Map<String, dynamic> json) {
    initialDataQuantity = json['initial_data_quantity'];
    initialDataUnit = json['initial_data_unit'];
    remDataQuantity = json['rem_data_quantity'];
    remDataUnit = json['rem_data_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['initial_data_quantity'] = initialDataQuantity;
    data['initial_data_unit'] = initialDataUnit;
    data['rem_data_quantity'] = remDataQuantity;
    data['rem_data_unit'] = remDataUnit;
    return data;
  }
}
