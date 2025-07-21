import 'package:result_type/result_type.dart';

extension ResultExtensions<T, E extends Exception> on Result<T, E> {
  void when({
    required void Function(T value) success,
    required void Function(E error) failure,
  }) {
    if (isSuccess) {
      success(this.success);
    } else {
      failure(this.failure);
    }
  }

  E? get failureOrNull => isFailure ? failure : null;
}
