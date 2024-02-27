abstract class BlocState {
  BlocState();
}

class InitialState extends BlocState {
  InitialState() : super();
}

class LoadingState extends BlocState {
  LoadingState() : super();
}

class DataFoundState<T> extends BlocState {
  T data;

  DataFoundState({required this.data}) : super();
}

class DataNotFoundState extends BlocState {
  String message;

  DataNotFoundState({required this.message}) : super();
}

class ErrorState extends BlocState {
  String message;

  ErrorState({required this.message}) : super();
}
