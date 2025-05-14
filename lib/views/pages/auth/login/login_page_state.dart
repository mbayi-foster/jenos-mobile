class LoginPageState {
  bool error;
  bool loading;
  bool showPassword;

  LoginPageState(
      {this.error = false, this.loading = false, this.showPassword = true});

  LoginPageState copyWith({bool? error, bool? loading, bool? showPassword}) =>
      LoginPageState(
          error: error ?? this.error,
          loading: loading ?? this.loading,
          showPassword: showPassword ?? this.showPassword);
}
