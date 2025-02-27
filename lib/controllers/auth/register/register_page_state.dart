class RegisterPageState {
  bool loading;
  bool error;
  RegisterPageState({this.loading = false, this.error = false});

  RegisterPageState copyWith({bool? loading, bool? error}) => RegisterPageState(
      loading: loading ?? this.loading, error: error ?? this.error);
}
