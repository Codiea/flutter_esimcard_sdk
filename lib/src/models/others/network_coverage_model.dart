class NetworkCoverage {
  String? networkName;
  String? networkCode;
  bool? twoG;
  bool? threeG;
  bool? fourG;
  bool? fiveG;

  NetworkCoverage(
      {this.networkName,
      this.networkCode,
      this.twoG,
      this.threeG,
      this.fourG,
      this.fiveG});

  NetworkCoverage.fromJson(Map<String, dynamic> json) {
    networkName = json['network_name'];
    networkCode = json['network_code'];
    twoG = json['two_g'];
    threeG = json['three_g'];
    fourG = json['four_G'];
    fiveG = json['five_G'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['network_name'] = networkName;
    data['network_code'] = networkCode;
    data['two_g'] = twoG;
    data['three_g'] = threeG;
    data['four_G'] = fourG;
    data['five_G'] = fiveG;
    return data;
  }
}
