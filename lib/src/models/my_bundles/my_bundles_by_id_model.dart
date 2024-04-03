import '../others/sim_model.dart';

class MyBundlesByIDResponseModel {
  bool? status;
  List<DataMyBundlesByIDResponseModel>? data;

  MyBundlesByIDResponseModel({this.status, this.data});

  MyBundlesByIDResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataMyBundlesByIDResponseModel>[];
      json['data'].forEach((v) {
        data!.add(DataMyBundlesByIDResponseModel.fromJson(v));
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

class DataMyBundlesByIDResponseModel {
  String? id;
  String? packageTypeId;
  String? simId;
  String? package;
  num? initialDataQuantity;
  String? initialDataUnit;
  num? remDataQuantity;
  String? remDataUnit;
  String? dateCreated;
  String? dateActivated;
  String? dateExpiry;
  bool? activated;
  String? status;
  Sim? sim;

  DataMyBundlesByIDResponseModel({
    this.id,
    this.packageTypeId,
    this.simId,
    this.package,
    this.initialDataQuantity,
    this.initialDataUnit,
    this.remDataQuantity,
    this.remDataUnit,
    this.dateCreated,
    this.dateActivated,
    this.dateExpiry,
    this.activated,
    this.status,
    this.sim,
  });

  DataMyBundlesByIDResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageTypeId = json['package_type_id'];
    simId = json['sim_id'];
    package = json['package'];
    initialDataQuantity = json['initial_data_quantity'];
    initialDataUnit = json['initial_data_unit'];
    remDataQuantity = json['rem_data_quantity'];
    remDataUnit = json['rem_data_unit'];
    dateCreated = json['date_created'];
    dateActivated = json['date_activated'];
    dateExpiry = json['date_expiry'];
    activated = json['activated'];
    status = json['status'];
    sim = json['sim'] != null ? Sim.fromJson(json['sim']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['package_type_id'] = packageTypeId;
    data['sim_id'] = simId;
    data['package'] = package;
    data['initial_data_quantity'] = initialDataQuantity;
    data['initial_data_unit'] = initialDataUnit;
    data['rem_data_quantity'] = remDataQuantity;
    data['rem_data_unit'] = remDataUnit;
    data['date_created'] = dateCreated;
    data['date_activated'] = dateActivated;
    data['date_expiry'] = dateExpiry;
    data['activated'] = activated;
    data['status'] = status;
    if (sim != null) {
      data['sim'] = sim!.toJson();
    }
    return data;
  }
}
