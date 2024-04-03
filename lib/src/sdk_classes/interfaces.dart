import '../models/extra/balance_model.dart';
import '../models/extra/network_coverage_model.dart';
import '../models/extra/refill_model.dart';
import '../models/my_bundles/my_bundles_by_id_model.dart';
import '../models/my_bundles/my_bundles_model.dart';
import '../models/my_bundles/my_esim_by_id_model.dart';
import '../models/my_bundles/my_esim_usage_by_id_model.dart';
import '../models/my_bundles/my_esims_model.dart';
import '../models/my_bundles/packages_detail_model.dart';
import '../models/purchase_bundles/continents_model.dart';
import '../models/purchase_bundles/countries_model.dart';
import '../models/purchase_bundles/global_packages_model.dart';
import '../models/purchase_bundles/packages_by_continent_model.dart';
import '../models/purchase_bundles/packages_by_country_model.dart';
import '../models/purchase_bundles/packages_model.dart';
import '../models/purchase_bundles/pricing_model.dart';
import '../models/purchase_bundles/purchase_data_only_model.dart';
import '../models/purchase_bundles/purchase_data_voice_sms_model.dart';
import '../extra/api_result_class.dart';
import '../extra/enum/enums_export.dart';
import '../extra/sdk_error.dart';

abstract class PurchaseBundlesInterface {
  Future<ApiResult<PackagesResponseModel, SdkError>> fetchPackages({
    required String newApiUrl,
    required String token,
    required String page,
    required EnumPackageType packageType,
  });

  Future<ApiResult<PricingResponseModel, SdkError>> fetchPricing({
    required String newApiUrl,
    required String token,
  });

  Future<ApiResult<CountriesResponseModel, SdkError>> fetchCountries({
    required String newApiUrl,
    required String token,
  });

  Future<ApiResult<PackagesByCountryResponseModel, SdkError>>
      fetchPackagesByCountry({
    required String newApiUrl,
    required String token,
    required String page,
  });

  Future<ApiResult<ContinentsResponseModel, SdkError>> fetchContinent({
    required String newApiUrl,
    required String token,
  });

  Future<ApiResult<PackagesByContinentResponseModel, SdkError>>
      fetchPackagesByContinent({
    required String newApiUrl,
    required String token,
    required String page,
  });

  Future<ApiResult<GlobalPackagesResponseModel, SdkError>> fetchGlobalPackages({
    required String newApiUrl,
    required String token,
    required String page,
  });

  Future<ApiResult<PurchaseDataOnlyResponseModel, SdkError>> purchaseDataOnly({
    required String newApiUrl,
    required String token,
    required String packageTypeID,
    required String iccid,
  });

  Future<ApiResult<PurchaseDataVoiceSmsResponseModel, SdkError>>
      purchaseDataVoiceSms({
    required String newApiUrl,
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
  });
}

abstract class MyBundlesInterface {
  Future<ApiResult<MyBundlesResponseModel, SdkError>> fetchMyBundles({
    required String newApiUrl,
    required String token,
    required String page,
  });

  Future<ApiResult<MyBundlesByIDResponseModel, SdkError>> fetchMyBundleByID({
    required String newApiUrl,
    required String token,
  });

  Future<ApiResult<MyEsimsResponseModel, SdkError>> fetchMyEsims({
    required String newApiUrl,
    required String token,
    required String page,
  });

  Future<ApiResult<MyEsimByIDResponseModel, SdkError>> fetchMyEsimByID({
    required String newApiUrl,
    required String token,
  });

  Future<ApiResult<MyEsimUsageByIDResponseModel, SdkError>>
      fetchMyEsimUsageByID({
    required String newApiUrl,
    required String token,
  });

  Future<ApiResult<PackageDetailResponseModel, SdkError>> fetchPackageDetail({
    required String newApiUrl,
    required String token,
  });
}

abstract class OtherInterface {
  Future<ApiResult<BalanceResponseModel, SdkError>> fetchBalance({
    required String newApiUrl,
    required String token,
  });

  Future<ApiResult<NetworkCoverageResponseModel, SdkError>>
      fetchNetworkCoverage({
    required String newApiUrl,
    required String token,
  });

  Future<ApiResult<RefillResponseModel, SdkError>> refill({
    required String newApiUrl,
    required String token,
    required String amount,
    required String cvv,
    required String cardNo,
    required String country,
    required String name,
    required String expiryDate,
  });
}
