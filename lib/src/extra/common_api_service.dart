import 'package:dio/dio.dart';
import 'package:esimcardsdk/src/extra/enum/enum_internal.dart';
import 'api_result_class.dart';

import 'sdk_error.dart';

Future<ApiResult<Map<String, dynamic>, SdkError>> commonApiService({
  required String apiUrl,
  required ApiRequestType apiMethod,
  required String token,
  Map<String, dynamic>? body,
  Map<String, dynamic>? queryParams,
  Duration? recTimeOut,
}) async {
  try {
    Response response;
    Dio dio = Dio();

    dio.options.headers = {
      'Authorization': 'Bearer $token',
      // "Accept": "application/json",
      "Accept": "Content-Type",
      "Content-Type": "application/json",
    };

    if (apiMethod == ApiRequestType.post) {
      response = await dio.post(
        apiUrl,
        data: body,
        queryParameters: queryParams,
        options: recTimeOut != null
            ? Options(
                receiveTimeout: recTimeOut,
              )
            : null,
      );
    } else {
      response = await dio.get(
        apiUrl,
        queryParameters: queryParams,
        options: recTimeOut != null
            ? Options(
                receiveTimeout: recTimeOut,
              )
            : null,
      );
    }

    if (response.statusCode == 200) {
      if (response.data.containsKey("status") &&
          response.data['status'] == true) {
        return ApiResult.success(response.data as Map<String, dynamic>);
      } else if (response.data.containsKey("status") &&
          response.data['status'] == false &&
          response.data.containsKey("message")) {
        return ApiResult.failure(
          CustomApiError(
            error: response.data["message"],
            statusCode: response.statusCode,
          ),
        );
      } else {
        return ApiResult.failure(
          InvalidResponseFromApi(
            statusCode: response.statusCode,
          ),
        );
      }
    } else {
      return ApiResult.failure(
        InvalidResponseFromApi(
          description: response.toString(),
          statusCode: response.statusCode,
        ),
      );
    }
  } catch (e) {
    if (e is DioException) {
      return ApiResult.failure(_customException(e));
    } else {
      return ApiResult.failure(InvalidResponseFromApi());
    }
  }
}

SdkError _customException(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return CustomApiError(
        error: "Timeout occurred while sending or receiving",
        statusCode: dioError.response?.statusCode,
      );

    case DioExceptionType.cancel:
      return CustomApiError(
        error: "Request to API server was cancelled",
        statusCode: dioError.response?.statusCode,
      );

    case DioExceptionType.unknown:
      return NetworkError(
        statusCode: dioError.response?.statusCode,
      );

    case DioExceptionType.badCertificate:
      return InternalServerError(
        statusCode: dioError.response?.statusCode,
      );

    case DioExceptionType.connectionError:
      return NetworkError(
        statusCode: dioError.response?.statusCode,
      );

    case DioExceptionType.badResponse:
      return _getErrorType(
        dioError.response?.statusCode,
        dioError.response?.data,
      );

    default:
      return CustomApiError(
        error: "Something went wrong, Error = ${dioError.response?.data}",
        statusCode: dioError.response?.statusCode,
      );
  }
}

SdkError _getErrorType(int? statusCode, dynamic error) {
  switch (statusCode) {
    case 400:
      return BadRequestError(
        description: error.toString(),
        statusCode: statusCode,
      );

    case 404:
      return NotFoundError(
        description: error.toString(),
        statusCode: statusCode,
      );

    case 500:
      return InternalServerError(
        description: error.toString(),
        statusCode: statusCode,
      );

    default:
      return CustomApiError(
        error: "Something went wrong, Error = $error",
        statusCode: statusCode,
        description: error.toString(),
      );
  }
}


// // class ApiResponse<T>{
// //   T? data;
// // }

// // T templatefunction<T>(data,toJson){
// //   T dataRes = toJson(data);
// //   return dataRes;
// // }


// // void callFunction(){
// //   var result = templatefunction<String>('',()=>'');
// // }


// typedef FromJson<T> = T Function(dynamic map);

// Future<ApiResult<T, SdkError>> commonApiService<T>({
//   required String apiUrl,
//   required ApiRequestType apiMethod,
//   required String token,
//   Map<String, dynamic>? body,
//   Map<String, dynamic>? queryParams,
//   Duration? recTimeOut,
//   FromJson<T>? fromJson,
// }) async {
//   try {
//     MyStyle.printm(apiUrl);

//     Response response;
//     Dio dio = Dio();

//     dio.options.headers = {
//       'Authorization': 'Bearer $token',
//       // "Accept": "application/json",
//       "Accept": "Content-Type",
//       "Content-Type": "application/json",
//     };

//     if (apiMethod == ApiRequestType.post) {
//       response = await dio.post(
//         apiUrl,
//         data: body,
//         queryParameters: queryParams,
//         options: recTimeOut != null
//             ? Options(
//                 receiveTimeout: recTimeOut,
//               )
//             : null,
//       );
//     } else {
//       response = await dio.get(
//         apiUrl,
//         queryParameters: queryParams,
//         options: recTimeOut != null
//             ? Options(
//                 receiveTimeout: recTimeOut,
//               )
//             : null,
//       );
//     }

//     if (response.statusCode == 200) {
//       if (response.data.containsKey("status") &&
//           response.data['status'] == true) {
//         var resData = fromJson!('');

//         // return ApiResult.success<T>(resData);

//         //  ApiResult.success(response.data as Map<String, dynamic>);
//       } else if (response.data.containsKey("status") &&
//           response.data['status'] == false &&
//           response.data.containsKey("message")) {
//         return ApiResult.failure(
//           CustomApiError(
//             description: response.data["message"],
//             statusCode: response.statusCode,
//           ),
//         );
//       } else {
//         return ApiResult.failure(
//           InvalidResponseFromApi(
//             statusCode: response.statusCode,
//           ),
//         );
//       }
//     } else {
//       return ApiResult.failure(
//         InvalidResponseFromApi(
//           comment: response.toString(),
//           statusCode: response.statusCode,
//         ),
//       );
//     }
//   } catch (e) {
//     MyStyle.printm("-----------exception 1 = $e");

//     if (e is DioException) {
//       MyStyle.printm("-----------exception 2 = ${e.message}");

//       return ApiResult.failure(_customException(e));
//     } else {
//       return ApiResult.failure(InvalidResponseFromApi());
//     }
//   }
// }
