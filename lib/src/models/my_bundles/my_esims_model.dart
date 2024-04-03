import '../others/meta_model.dart';

class MyEsimsResponseModel {
  bool? status;
  Meta? meta;
  List<DataMyEsimsResponseModel>? data;

  MyEsimsResponseModel({this.status, this.meta, this.data});

  MyEsimsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <DataMyEsimsResponseModel>[];
      json['data'].forEach((v) {
        data!.add(DataMyEsimsResponseModel.fromJson(v));
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

class DataMyEsimsResponseModel {
  int? id;
  String? qrCodeText;
  String? smdpAddress;
  String? matchingId;
  String? createdAt;
  String? lastBundle;
  String? status;
  int? totalBundles;

  DataMyEsimsResponseModel(
      {this.id,
      this.qrCodeText,
      this.smdpAddress,
      this.matchingId,
      this.createdAt,
      this.lastBundle,
      this.status,
      this.totalBundles});

  DataMyEsimsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qrCodeText = json['qr_code_text'];
    smdpAddress = json['smdp_address'];
    matchingId = json['matching_id'];
    createdAt = json['created_at'];
    lastBundle = json['last_bundle'];
    status = json['status'];
    totalBundles = json['total_bundles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['qr_code_text'] = qrCodeText;
    data['smdp_address'] = smdpAddress;
    data['matching_id'] = matchingId;
    data['created_at'] = createdAt;
    data['last_bundle'] = lastBundle;
    data['status'] = status;
    data['total_bundles'] = totalBundles;
    return data;
  }
}
