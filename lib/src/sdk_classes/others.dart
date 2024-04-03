import '../models/extra/balance_model.dart';
import '../models/extra/network_coverage_model.dart';
import '../models/extra/refill_model.dart';
import '../extra/api_result_class.dart';
import '../extra/common_api_service.dart';
import '../extra/enums.dart';
import '../extra/sdk_error.dart';
import 'interfaces.dart';

class Others implements OtherInterface {
  @override
  Future<ApiResult<BalanceResponseModel, SdkError>> fetchBalance({
    required String newApiUrl,
    required String token,
  }) async {
    ApiResult<Map<String, dynamic>, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.get_,
      apiUrl: newApiUrl,
      token: token,
    );

    if (res.isSuccess) {
      //ejaz
      return ApiResult.success(BalanceResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  @override
  Future<ApiResult<NetworkCoverageResponseModel, SdkError>>
      fetchNetworkCoverage({
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
          NetworkCoverageResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }

  //ejaz
  @override
  Future<ApiResult<RefillResponseModel, SdkError>> refill({
    required String newApiUrl,
    required String token,
    required String amount,
    required String cvv,
    required String cardNo,
    required String country,
    required String name,
    required String expiryDate,
  }) async {
    ApiResult<Map<String, dynamic>, SdkError> res = await commonApiService(
      apiMethod: ApiRequestType.post,
      apiUrl: newApiUrl,
      token: token,
      queryParams: {
        "amount": amount,
        "cvv": cvv,
        "card_no": cardNo,
        "country": country,
        "name": name,
        "expiry_date": expiryDate,
      },
    );

    if (res.isSuccess) {
      //ejaz
      return ApiResult.success(RefillResponseModel.fromJson(res.data!));
    } else {
      return ApiResult.failure(res.error!);
    }
  }
}
