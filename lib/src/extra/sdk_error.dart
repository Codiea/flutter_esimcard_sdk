class SdkError extends Error implements Exception {
  final String? description;
  final int? statusCode;

  SdkError({
    this.description,
    this.statusCode,
  });

  @override
  String toString() {
    return 'SdkError: $statusCode $description';
  }
}

class CustomApiError extends SdkError {
  final String error;

  CustomApiError({
    super.description,
    super.statusCode,
    required this.error,
  });

  @override
  String toString() {
    return 'CustomApiError: $error. Status Code: $statusCode. Comment: $description';
  }
}

class SdkNotInitializedError extends SdkError {
  SdkNotInitializedError({super.description, super.statusCode});

  @override
  String toString() {
    return 'SdkNotInitializedError: Initialize SDK first, before continuing. Status Code: $statusCode. Comment: $description.';
  }
}

class NetworkError extends SdkError {
  NetworkError({super.description, super.statusCode});

  @override
  String toString() {
    return 'NetworkError: Network error occurred. Status Code: $statusCode. Comment: $description';
  }
}

class ServerError extends SdkError {
  ServerError({super.description, super.statusCode});

  @override
  String toString() {
    return 'ServerError: Server error occurred. Status Code: $statusCode. Comment: $description';
  }
}

class InvalidResponseFromApi extends SdkError {
  InvalidResponseFromApi({super.description, super.statusCode});

  @override
  String toString() {
    return 'InvalidResponseFromApi: Invalid response received. Status Code: $statusCode. Comment: $description';
  }
}

class NotFoundError extends SdkError {
  NotFoundError({super.description, super.statusCode});

  @override
  String toString() {
    return 'NotFoundError: Status Code: 404, Comment: $description';
  }
}

class BadRequestError extends SdkError {
  BadRequestError({super.description, required super.statusCode});

  @override
  String toString() {
    return 'BadRequestError: Status Code: 400, Comment: $description';
  }
}

class InternalServerError extends SdkError {
  InternalServerError({super.description, required super.statusCode});

  @override
  String toString() {
    return 'InternalServerError: Status Code: 500, Comment: $description';
  }
}
