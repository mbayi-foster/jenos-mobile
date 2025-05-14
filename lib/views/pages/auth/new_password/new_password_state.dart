class NewPasswordState {
  bool loading;
  bool error;
  bool done;
  String email;

  NewPasswordState({
    this.loading = false,
    this.error = false,
    this.done = false,
    this.email = ''
  });
}