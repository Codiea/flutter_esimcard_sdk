class ApiResult<T, ApiError> {
  final T? data;
  final ApiError? error;
  final bool isSuccess;

  ApiResult({
    this.data,
    this.error,
    required this.isSuccess,
  });

  // Factory method to create success result
  factory ApiResult.success(T data) {
    return ApiResult(
      data: data,
      isSuccess: true,
    );
  }

  // Factory method to create failure result
  factory ApiResult.failure(ApiError error) {
    return ApiResult(
      error: error,
      isSuccess: false,
    );
  }

  @override
  String toString() {
    return "Success: $isSuccess\nData: $data\nError: $error\n";
  }
}
