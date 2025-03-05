import 'package:jenos_app/models/principals/user.dart';

class ProfilePageState {
  bool edit;
  User? user;
  ProfilePageState({this.edit = true, this.user});

  ProfilePageState copyWith({bool? edit, User? user}) =>
      ProfilePageState(edit: edit ?? this.edit, user: user ?? this.user);
}
