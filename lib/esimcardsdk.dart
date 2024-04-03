library esimcardsdk;

import 'src/models/extra/balance_model.dart';
import 'src/models/extra/network_coverage_model.dart';
import 'src/models/extra/refill_model.dart';
import 'src/models/my_bundles/my_bundles_by_id_model.dart';
import 'src/models/my_bundles/my_bundles_model.dart';
import 'src/models/my_bundles/my_esim_by_id_model.dart';
import 'src/models/my_bundles/my_esim_usage_by_id_model.dart';
import 'src/models/my_bundles/my_esims_model.dart';
import 'src/models/my_bundles/packages_detail_model.dart';
import 'src/models/purchase_bundles/continents_model.dart';
import 'src/models/purchase_bundles/countries_model.dart';
import 'src/models/purchase_bundles/global_packages_model.dart';
import 'src/models/purchase_bundles/packages_by_continent_model.dart';
import 'src/models/purchase_bundles/packages_by_country_model.dart';
import 'src/models/purchase_bundles/packages_model.dart';
import 'src/models/purchase_bundles/pricing_model.dart';
import 'src/models/purchase_bundles/purchase_data_only_model.dart';
import 'src/models/purchase_bundles/purchase_data_voice_sms_model.dart';
import 'src/extra/api_result_class.dart';
import 'src/extra/api_util.dart';
import 'src/extra/common_api_service.dart';
import 'src/extra/enums.dart';
import 'src/extra/sdk_error.dart';
import 'src/sdk_classes/my_bundles.dart';
import 'src/sdk_classes/others.dart';
import 'src/sdk_classes/puchase_bundles.dart';

class EsimCardSDK {
  static final EsimCardSDK _instance = EsimCardSDK._internal();

  factory EsimCardSDK() {
    return _instance;
  }

  EsimCardSDK._internal();
  //----------------------------------------------------------------------------
  //---------------------------- VARIABLES -------------------------------------

  bool _appConfigDone = false;
  String? _newApiUrl;
  String? _token;
  //----------------------------------------------------------------------------
  //---------------------------- FUNCTIONS -------------------------------------

  Future<ApiResult<String, SdkError>> config(String t) async {
    if (t == _token && _appConfigDone) {
      return ApiResult.success("sdk initialized");
    }

    _token = t;

    ApiResult<String, SdkError> r = await _fetchInitUrl(_token!);

    if (r.isSuccess && r.data != null) {
      _appConfigDone = true;
      _newApiUrl = r.data!;
      return ApiResult.success("sdk initialized");
    } else {
      _resetSDK();
      return ApiResult.failure(r.error!);
    }
  }

  void _resetSDK() {
    _newApiUrl = null;
    _appConfigDone = false;
    _token = null;
  }

  Future<ApiResult<String, SdkError>> _fetchInitUrl(String t) async {
    ApiResult<Map<String, dynamic>?, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.get_,
      apiUrl: ApiUtils.fetchInitUrl,
      token: t,
    );

    if (res.isSuccess) {
      if (res.data!["status"] is bool) {
        if (res.data!["status"]) {
          var str = ApiUtils.baseUrl + res.data!["data"];
          return ApiResult.success(str);
        } else {
          return ApiResult.failure(
            CustomApiError(
              description: res.data!["message"] ?? "something went wrong",
            ),
          );
        }
      } else {
        return ApiResult.failure(InvalidResponseFromApi());
      }
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  //----------------------------------------------------------------------------
  //----------------------- PURCHASE FUNCTIONS ---------------------------------

  Future<ApiResult<PackagesResponseModel, SdkError>> fetchPackages({
    required String token,
    required EnumPackageType packageType,
    String page = "1",
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await PurchaseBundlesImpl().fetchPackages(
      newApiUrl: ApiUtils.getPackagesUrl(_newApiUrl!),
      token: token,
      page: page,
      packageType: packageType,
    );
  }

  Future<ApiResult<PricingResponseModel, SdkError>> fetchPricing({
    required String token,
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await PurchaseBundlesImpl().fetchPricing(
      newApiUrl: ApiUtils.getPricingUrl(_newApiUrl!),
      token: token,
    );
  }

  Future<ApiResult<CountriesResponseModel, SdkError>> fetchCountries({
    required String token,
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await PurchaseBundlesImpl().fetchCountries(
      newApiUrl: ApiUtils.getCountriesUrl(_newApiUrl!),
      token: token,
    );
  }

  Future<ApiResult<PackagesByCountryResponseModel, SdkError>>
      fetchPackagesByCountry({
    required String token,
    required String countryID,
    String page = "1",
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await PurchaseBundlesImpl().fetchPackagesByCountry(
      newApiUrl: ApiUtils.getPackagesByCountryUrl(_newApiUrl!, countryID),
      token: token,
      page: page,
    );
  }

  Future<ApiResult<ContinentsResponseModel, SdkError>> fetchContinent({
    required String token,
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await PurchaseBundlesImpl().fetchContinent(
      newApiUrl: ApiUtils.getContinentsUrl(_newApiUrl!),
      token: token,
    );
  }

  Future<ApiResult<PackagesByContinentResponseModel, SdkError>>
      fetchPackagesByContinent({
    required String token,
    required String countryID,
    String page = "1",
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await PurchaseBundlesImpl().fetchPackagesByContinent(
      newApiUrl: ApiUtils.getPackagesByContinentUrl(_newApiUrl!, countryID),
      token: token,
      page: page,
    );
  }

  Future<ApiResult<GlobalPackagesResponseModel, SdkError>> fetchGlobalPackages({
    required String token,
    String page = "1",
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await PurchaseBundlesImpl().fetchGlobalPackages(
      newApiUrl: ApiUtils.getGlobalPackagesUrl(_newApiUrl!),
      token: token,
      page: page,
    );
  }

  Future<ApiResult<PurchaseDataOnlyResponseModel, SdkError>> purchaseDataOnly({
    required String token,
    required String packageTypeID,
    required String iccid,
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await PurchaseBundlesImpl().purchaseDataOnly(
      newApiUrl: ApiUtils.purchaseDataOnlyUrl(_newApiUrl!),
      token: token,
      packageTypeID: packageTypeID,
      iccid: iccid,
    );
  }

  Future<ApiResult<PurchaseDataVoiceSmsResponseModel, SdkError>>
      purchaseDataVoiceSms({
    required String token,
    required String packageTypeID,
    required String firstName,
    required String lastName,
    required String zipcode,
    required String state,
    required String city,
    required String address1,
    required String address2,
    required String imei,
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await PurchaseBundlesImpl().purchaseDataVoiceSms(
      newApiUrl: ApiUtils.purchaseDataVoiceSmsUrl(_newApiUrl!),
      token: token,
      firstName: firstName,
      lastName: lastName,
      address1: address1,
      address2: address2,
      city: city,
      imei: imei,
      packageTypeID: packageTypeID,
      state: state,
      zipcode: zipcode,
    );
  }

  //----------------------------------------------------------------------------
  //----------------------- MY BUNDLES FUNCTIONS -------------------------------

  Future<ApiResult<MyBundlesResponseModel, SdkError>> fetchMyBundles({
    required String token,
    String page = "1",
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await MyBundles().fetchMyBundles(
      newApiUrl: ApiUtils.getMyBundlesUrl(_newApiUrl!),
      token: token,
      page: page,
    );
  }

  Future<ApiResult<MyBundlesByIDResponseModel, SdkError>> fetchMyBundleByID({
    required String token,
    required String id,
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await MyBundles().fetchMyBundleByID(
      newApiUrl: ApiUtils.getMyBundleByIDUrl(_newApiUrl!, id),
      token: token,
    );
  }

  Future<ApiResult<MyEsimsResponseModel, SdkError>> fetchMyEsims({
    required String token,
    String page = "1",
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await MyBundles().fetchMyEsims(
      newApiUrl: ApiUtils.getMyEsimsUrl(_newApiUrl!),
      token: token,
      page: page,
    );
  }

  Future<ApiResult<MyEsimByIDResponseModel, SdkError>> fetchMyEsimByID({
    required String token,
    required String id,
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await MyBundles().fetchMyEsimByID(
      newApiUrl: ApiUtils.getMyEsimByIDUrl(_newApiUrl!, id),
      token: token,
    );
  }

  Future<ApiResult<MyEsimUsageByIDResponseModel, SdkError>>
      fetchMyEsimUsageByID({
    required String token,
    required String id,
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await MyBundles().fetchMyEsimUsageByID(
      newApiUrl: ApiUtils.getMyEsimUsageByIDUrl(_newApiUrl!, id),
      token: token,
    );
  }

  Future<ApiResult<PackageDetailResponseModel, SdkError>> fetchPackageDetail({
    required String token,
    required String id,
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await MyBundles().fetchPackageDetail(
      newApiUrl: ApiUtils.getPackageDetailUrl(_newApiUrl!, id),
      token: token,
    );
  }

  //----------------------------------------------------------------------------
  //---------------------------- OTHER FUNCTIONS -------------------------------

  Future<ApiResult<BalanceResponseModel, SdkError>> fetchBalance({
    required String token,
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await Others().fetchBalance(
      newApiUrl: ApiUtils.getBalanceUrl(_newApiUrl!),
      token: token,
    );
  }

  Future<ApiResult<NetworkCoverageResponseModel, SdkError>>
      fetchNetworkCoverage({
    required String token,
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await Others().fetchNetworkCoverage(
      newApiUrl: ApiUtils.getNetworkCoverageUrl(_newApiUrl!),
      token: token,
    );
  }

  Future<ApiResult<RefillResponseModel, SdkError>> refill({
    required String token,
    required String amount,
    required String cvv,
    required String cardNo,
    required String country,
    required String name,
    required String expiryDate,
  }) async {
    if (_appConfigDone == false) {
      return ApiResult.failure(SdkNotInitializedError());
    }

    return await Others().refill(
      newApiUrl: ApiUtils.getRefillUrl(_newApiUrl!),
      token: token,
      amount: amount,
      cardNo: cardNo,
      country: country,
      cvv: cvv,
      expiryDate: expiryDate,
      name: name,
    );
  }
}
