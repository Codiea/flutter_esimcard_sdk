import '../others/network_coverage_model.dart';

class NetworkCoverageResponseModel {
  bool? status;
  List<DataNetworkCoverageResponseModel>? data;

  NetworkCoverageResponseModel({this.status, this.data});

  NetworkCoverageResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataNetworkCoverageResponseModel>[];
      json['data'].forEach((v) {
        data!.add(DataNetworkCoverageResponseModel.fromJson(v));
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

class DataNetworkCoverageResponseModel {
  int? id;
  String? name;
  String? imageUrl;
  List<NetworkCoverage>? networkCoverage;

  DataNetworkCoverageResponseModel(
      {this.id, this.name, this.imageUrl, this.networkCoverage});

  DataNetworkCoverageResponseModel.fromJson(Map<String, dynamic> json) {
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
