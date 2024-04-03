import 'package:esimcardsdk/esimcardsdk.dart';

Future<void> main() async {
  const String token = "";
  EsimCardSDK esimCardSDK = EsimCardSDK();

  // first you cave to call config, to set the sdk
  ApiResult<String, SdkError> configRes = await esimCardSDK.config(token);

  // if the config isSuccess is true, you can now call other functions
  if (configRes.isSuccess) {
    ApiResult<CountriesResponseModel, SdkError> result =
        await esimCardSDK.fetchCountries(token: token);
    if (result.isSuccess) {
      for (var i = 0; i < result.data!.data!.length; i++) {
        // print(result.data!.data![i].name);
      }
    }
  }
}
