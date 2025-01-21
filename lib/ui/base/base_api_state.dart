abstract class BaseApiState {}

class BaseLoadingState extends BaseApiState {}

class BaseSuccessState<T> extends BaseApiState {
  T data;
  BaseSuccessState(this.data);
}

class BaseErrorState extends BaseApiState {
  String error;
  BaseErrorState(this.error);
}
