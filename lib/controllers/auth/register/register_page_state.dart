import 'package:jenos_app/models/principals/user.dart';

class RegisterPageState {
  bool loading;
  bool error;
  String msg;
  int code;
  User? user;
  bool showPassword;
  RegisterPageState(
      {this.msg = '',
      this.showPassword = true,
      this.loading = false,
      this.error = false,
      this.code = 0,
      this.user});

  RegisterPageState copyWith(
          {String? msg,
          bool? showPassword,
          bool? loading,
          bool? error,
          int? code,
          User? user}) =>
      RegisterPageState(
          loading: loading ?? this.loading,
          showPassword: showPassword ?? this.showPassword,
          error: error ?? this.error,
          code: code ?? this.code,
          user: user ?? this.user,
          msg: msg ?? this.msg);
}
