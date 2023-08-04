abstract class ResponseResult<T> {}

class Loading<T> extends ResponseResult<T> {}

class Success<T> extends ResponseResult<T> {
  Success({required this.data});

  final T data;
}

class Error<T> extends ResponseResult<T> {
  Error({required this.exception});

  final T exception;
}
