import '../extra/enum/enum_internal.dart';
import '../models/my_bundles/my_bundles_by_id_model.dart';
import '../models/my_bundles/my_bundles_model.dart';
import '../models/my_bundles/my_esim_by_id_model.dart';
import '../models/my_bundles/my_esim_usage_by_id_model.dart';
import '../models/my_bundles/my_esims_model.dart';
import '../models/my_bundles/packages_detail_model.dart';
import '../extra/api_result_class.dart';
import '../extra/common_api_service.dart';

import '../extra/sdk_error.dart';
import 'interfaces.dart';

class MyBundles implements MyBundlesInterface {
  @override
  Future<ApiResult<MyBundlesResponseModel, SdkError>> fetchMyBundles({
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
      return ApiResult.success(MyBundlesResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  @override
  Future<ApiResult<MyBundlesByIDResponseModel, SdkError>> fetchMyBundleByID({
    required String newApiUrl,
    required String token,
  }) async {
    ApiResult<Map<String, dynamic>, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.get_,
      apiUrl: newApiUrl,
      token: token,
    );

    if (res.isSuccess) {
      return ApiResult.success(MyBundlesByIDResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  @override
  Future<ApiResult<MyEsimsResponseModel, SdkError>> fetchMyEsims({
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
      return ApiResult.success(MyEsimsResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  @override
  Future<ApiResult<MyEsimByIDResponseModel, SdkError>> fetchMyEsimByID({
    required String newApiUrl,
    required String token,
  }) async {
    ApiResult<Map<String, dynamic>, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.get_,
      apiUrl: newApiUrl,
      token: token,
    );

    if (res.isSuccess) {
      return ApiResult.success(MyEsimByIDResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  @override
  Future<ApiResult<PackageDetailResponseModel, SdkError>> fetchPackageDetail({
    required String newApiUrl,
    required String token,
  }) async {
    ApiResult<Map<String, dynamic>, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.get_,
      apiUrl: newApiUrl,
      token: token,
    );

    if (res.isSuccess) {
      return ApiResult.success(PackageDetailResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  @override
  Future<ApiResult<MyEsimUsageByIDResponseModel, SdkError>>
      fetchMyEsimUsageByID({
    required String newApiUrl,
    required String token,
  }) async {
    ApiResult<Map<String, dynamic>, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.get_,
      apiUrl: newApiUrl,
      token: token,
    );

    if (res.isSuccess) {
      return ApiResult.success(
          MyEsimUsageByIDResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }
}
