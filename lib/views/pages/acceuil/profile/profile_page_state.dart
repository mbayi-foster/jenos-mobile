import 'package:jenos_app/models/principals/commune.dart';
import 'package:jenos_app/models/principals/user.dart';

class ProfilePageState {
  bool edit;
  User? user;
  bool isLoad;
  bool error;
  List<Commune> communes;
  ProfilePageState(
      {this.edit = true, this.communes = const [], this.user, this.isLoad = false, this.error = false});

  ProfilePageState copyWith(
          {bool? edit, User? user, bool? isLoad, bool? error}) =>
      ProfilePageState(
        edit: edit ?? this.edit,
        user: user ?? this.user,
        isLoad: isLoad ?? this.isLoad,
        error: error ?? this.error
      );
}
