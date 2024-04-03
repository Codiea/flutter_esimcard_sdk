import '../others/sim_model.dart';

class MyEsimByIDResponseModel {
  bool? status;
  DataMyEsimByIDResponseModel? data;

  MyEsimByIDResponseModel({this.status, this.data});

  MyEsimByIDResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? DataMyEsimByIDResponseModel.fromJson(json['data'])
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

class DataMyEsimByIDResponseModel {
  Sim? sim;

  List<RevokedPackages>? inUsePackages;
  List<RevokedPackages>? assignedPackages;
  List<RevokedPackages>? completedPackages;
  List<RevokedPackages>? revokedPackages;
  List<Coverage>? coverage;
  OverallUsage? overallUsage;

  DataMyEsimByIDResponseModel(
      {this.sim,
      this.inUsePackages,
      this.assignedPackages,
      this.completedPackages,
      this.revokedPackages,
      this.coverage,
      this.overallUsage});

  DataMyEsimByIDResponseModel.fromJson(Map<String, dynamic> json) {
    sim = json['sim'] != null ? Sim.fromJson(json['sim']) : null;
    if (json['in_use_packages'] != null) {
      inUsePackages = <RevokedPackages>[];
      json['in_use_packages'].forEach((v) {
        inUsePackages!.add(RevokedPackages.fromJson(v));
      });
    }
    if (json['assigned_packages'] != null) {
      assignedPackages = <RevokedPackages>[];
      json['assigned_packages'].forEach((v) {
        assignedPackages!.add(RevokedPackages.fromJson(v));
      });
    }
    if (json['completed_packages'] != null) {
      completedPackages = <RevokedPackages>[];
      json['completed_packages'].forEach((v) {
        completedPackages!.add(RevokedPackages.fromJson(v));
      });
    }
    if (json['revoked_packages'] != null) {
      revokedPackages = <RevokedPackages>[];
      json['revoked_packages'].forEach((v) {
        revokedPackages!.add(RevokedPackages.fromJson(v));
      });
    }
    if (json['coverage'] != null) {
      coverage = <Coverage>[];
      json['coverage'].forEach((v) {
        coverage!.add(Coverage.fromJson(v));
      });
    }
    overallUsage = json['overall_usage'] != null
        ? OverallUsage.fromJson(json['overall_usage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sim != null) {
      data['sim'] = sim!.toJson();
    }
    if (inUsePackages != null) {
      data['in_use_packages'] = inUsePackages!.map((v) => v.toJson()).toList();
    }
    if (assignedPackages != null) {
      data['assigned_packages'] =
          assignedPackages!.map((v) => v.toJson()).toList();
    }
    if (completedPackages != null) {
      data['completed_packages'] =
          completedPackages!.map((v) => v.toJson()).toList();
    }
    if (revokedPackages != null) {
      data['revoked_packages'] =
          revokedPackages!.map((v) => v.toJson()).toList();
    }
    if (coverage != null) {
      data['coverage'] = coverage!.map((v) => v.toJson()).toList();
    }
    if (overallUsage != null) {
      data['overall_usage'] = overallUsage!.toJson();
    }
    return data;
  }
}

class RevokedPackages {
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

  RevokedPackages(
      {this.id,
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
      this.sim});

  RevokedPackages.fromJson(Map<String, dynamic> json) {
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

class Coverage {
  int? id;
  String? countryName;
  String? code;
  String? iso;
  String? countryImageUrl;
  String? networkName;
  String? networkCode;
  bool? t2G;
  bool? th3G;
  bool? for4G;
  bool? fiv5G;

  Coverage(
      {this.id,
      this.countryName,
      this.code,
      this.iso,
      this.countryImageUrl,
      this.networkName,
      this.networkCode,
      this.t2G,
      this.th3G,
      this.for4G,
      this.fiv5G});

  Coverage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryName = json['country_name'];
    code = json['code'];
    iso = json['iso'];
    countryImageUrl = json['country_image_url'];
    networkName = json['network_name'];
    networkCode = json['network_code'];
    t2G = json['t_2G'];
    th3G = json['th_3G'];
    for4G = json['for-4G'];
    fiv5G = json['fiv_5G'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country_name'] = countryName;
    data['code'] = code;
    data['iso'] = iso;
    data['country_image_url'] = countryImageUrl;
    data['network_name'] = networkName;
    data['network_code'] = networkCode;
    data['t_2G'] = t2G;
    data['th_3G'] = th3G;
    data['for-4G'] = for4G;
    data['fiv_5G'] = fiv5G;
    return data;
  }
}

class OverallUsage {
  num? initialDataQuantity;
  String? initialDataUnit;
  num? remDataQuantity;
  String? remDataUnit;

  OverallUsage(
      {this.initialDataQuantity,
      this.initialDataUnit,
      this.remDataQuantity,
      this.remDataUnit});

  OverallUsage.fromJson(Map<String, dynamic> json) {
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
