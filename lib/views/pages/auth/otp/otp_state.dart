class OtpState {
  bool loading;
  bool error;
  String msg;
  String lastPage;

  OtpState(
      {this.error = false,
      this.loading = false,
      this.msg = "",
      this.lastPage = 'register'});

  OtpState copyWith({bool? error, bool? loading, String? msg}) => OtpState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      msg: msg ?? this.msg);
}
