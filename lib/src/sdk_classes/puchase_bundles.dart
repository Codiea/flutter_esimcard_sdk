import '../extra/enum/enum_internal.dart';
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
import '../extra/common_api_service.dart';
import '../extra/enum/enums_export.dart';
import '../extra/sdk_error.dart';
import 'interfaces.dart';

class PurchaseBundlesImpl implements PurchaseBundlesInterface {
  @override
  Future<ApiResult<PackagesResponseModel, SdkError>> fetchPackages({
    required String newApiUrl,
    required String token,
    required String page,
    required EnumPackageType packageType,
  }) async {
    ApiResult<Map<String, dynamic>, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.get_,
      apiUrl: newApiUrl,
      token: token,
      queryParams: {
        "page": page,
        "package_type": packageType == EnumPackageType.dataOnly
            ? "DATA-ONLY"
            : "DATA-ONLY-SMS"
      },
    );

    if (res.isSuccess) {
      return ApiResult.success(PackagesResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  @override
  Future<ApiResult<PricingResponseModel, SdkError>> fetchPricing({
    required String newApiUrl,
    required String token,
  }) async {
    ApiResult<Map<String, dynamic>, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.get_,
      apiUrl: newApiUrl,
      token: token,
    );

    if (res.isSuccess) {
      return ApiResult.success(PricingResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  @override
  Future<ApiResult<CountriesResponseModel, SdkError>> fetchCountries({
    required String newApiUrl,
    required String token,
  }) async {
    ApiResult<Map<String, dynamic>, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.get_,
      apiUrl: newApiUrl,
      token: token,
    );

    if (res.isSuccess) {
      return ApiResult.success(CountriesResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  @override
  Future<ApiResult<PackagesByCountryResponseModel, SdkError>>
      fetchPackagesByCountry({
    required String newApiUrl,
    required String token,
    required String page,
  }) async {
    ApiResult<Map<String, dynamic>, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.get_,
      apiUrl: newApiUrl,
      token: token,
      queryParams: {
        "page": page,
      },
    );

    if (res.isSuccess) {
      return ApiResult.success(
          PackagesByCountryResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  @override
  Future<ApiResult<ContinentsResponseModel, SdkError>> fetchContinent({
    required String newApiUrl,
    required String token,
  }) async {
    ApiResult<Map<String, dynamic>, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.get_,
      apiUrl: newApiUrl,
      token: token,
    );

    if (res.isSuccess) {
      return ApiResult.success(ContinentsResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  @override
  Future<ApiResult<PackagesByContinentResponseModel, SdkError>>
      fetchPackagesByContinent({
    required String newApiUrl,
    required String token,
    required String page,
  }) async {
    ApiResult<Map<String, dynamic>, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.get_,
      apiUrl: newApiUrl,
      token: token,
      queryParams: {
        "page": page,
      },
    );

    if (res.isSuccess) {
      return ApiResult.success(
          PackagesByContinentResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  @override
  Future<ApiResult<GlobalPackagesResponseModel, SdkError>> fetchGlobalPackages({
    required String newApiUrl,
    required String token,
    required String page,
  }) async {
    ApiResult<Map<String, dynamic>, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.get_,
      apiUrl: newApiUrl,
      token: token,
      queryParams: {
        "page": page,
      },
    );

    if (res.isSuccess) {
      return ApiResult.success(GlobalPackagesResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  @override
  Future<ApiResult<PurchaseDataOnlyResponseModel, SdkError>> purchaseDataOnly({
    required String newApiUrl,
    required String token,
    required String packageTypeID,
    required String iccid,
  }) async {
    ApiResult<Map<String, dynamic>, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.post,
      apiUrl: newApiUrl,
      token: token,
      queryParams: {
        "package_type_id": packageTypeID,
        "iccid": iccid,
      },
    );

    if (res.isSuccess) {
      return ApiResult.success(
          PurchaseDataOnlyResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  @override
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
  }) async {
    ApiResult<Map<String, dynamic>, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.post,
      apiUrl: newApiUrl,
      token: token,
      queryParams: {
        "zipcode": zipcode,
        "first_name": firstName,
        "last_name": lastName,
        "address1": address1,
        "address2": address2,
        "city": city,
        "state": state,
        "package_type_id": packageTypeID,
        "imei": imei
      },
    );

    if (res.isSuccess) {
      return ApiResult.success(
          PurchaseDataVoiceSmsResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }
}
