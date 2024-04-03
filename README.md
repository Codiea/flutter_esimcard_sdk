
A Flutter implementation of esimcard sdk.

## Getting started
Before you start, create an account with the providers and receive the token.

## Usage
To start using this plugin, add `esimcardsdk` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/):

```yaml
dependencies:
  esimcardsdk: ^0.0.4
```


### Example

```dart

import 'package:esimcardsdk/esimcardsdk.dart';
import 'package:esimcardsdk/src/extra/api_result_class.dart';
import 'package:esimcardsdk/src/extra/sdk_error.dart';
import 'package:esimcardsdk/src/models/purchase_bundles/countries_model.dart';

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
        print(result.data!.data![i].name);
      }
    }
  }
}
```
