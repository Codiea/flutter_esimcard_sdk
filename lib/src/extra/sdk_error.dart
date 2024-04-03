class SdkError extends Error implements Exception {
  final String? comment;
  final int? statusCode;

  SdkError({
    this.comment,
    this.statusCode,
  });

  @override
  String toString() {
    return 'SdkError: $statusCode $comment';
  }
}

class CustomApiError extends SdkError {
  final String description;

  CustomApiError({
    super.comment,
    super.statusCode,
    required this.description,
  });

  @override
  String toString() {
    return 'CustomApiError: $description. Status Code: $statusCode. Comment: $comment';
  }
}

class SdkNotInitializedError extends SdkError {
  SdkNotInitializedError({super.comment, super.statusCode});

  @override
  String toString() {
    return 'SdkNotInitializedError: Initialize SDK first, before continuing. Status Code: $statusCode. Comment: $comment.';
  }
}

class NetworkError extends SdkError {
  NetworkError({super.comment, super.statusCode});

  @override
  String toString() {
    return 'NetworkError: Network error occurred. Status Code: $statusCode. Comment: $comment';
  }
}

class ServerError extends SdkError {
  ServerError({super.comment, super.statusCode});

  @override
  String toString() {
    return 'ServerError: Server error occurred. Status Code: $statusCode. Comment: $comment';
  }
}

class InvalidResponseFromApi extends SdkError {
  InvalidResponseFromApi({super.comment, super.statusCode});

  @override
  String toString() {
    return 'InvalidResponseFromApi: Invalid response received. Status Code: $statusCode. Comment: $comment';
  }
}

class NotFoundError extends SdkError {
  NotFoundError({super.comment, super.statusCode});

  @override
  String toString() {
    return 'NotFoundError: Status Code: 404, Comment: $comment';
  }
}

class BadRequestError extends SdkError {
  BadRequestError({super.comment, required super.statusCode});

  @override
  String toString() {
    return 'BadRequestError: Status Code: 400, Comment: $comment';
  }
}

class InternalServerError extends SdkError {
  InternalServerError({super.comment, required super.statusCode});

  @override
  String toString() {
    return 'InternalServerError: Status Code: 500, Comment: $comment';
  }
}
