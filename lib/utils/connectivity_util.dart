// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter_application_sdk/utils/server/enums.dart';
// import 'package:flutter_application_sdk/utils/server/general_class.dart';

// Future<GeneralClassApi> initConnectivity() async {
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.mobile) {
//     return GeneralClassApi(
//       myReturn: EnumReturn.ok,
//     );
//   } else if (connectivityResult == ConnectivityResult.wifi) {
//     return GeneralClassApi(
//       myReturn: EnumReturn.ok,
//     );
//   } else {
//     return GeneralClassApi(
//       myReturn: EnumReturn.error,
//       message: "No Internet Access",
//     );
//   }
// }
