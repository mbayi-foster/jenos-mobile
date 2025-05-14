class NewPasswordState {
  bool loading;
  bool error;
  bool password;
  String email;
  int lastPage;

  NewPasswordState(
      {this.loading = false,
      this.error = false,
      this.password = true,
      this.email = '' ,
      this.lastPage = 0,
 });
}