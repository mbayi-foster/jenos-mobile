import 'package:jenos_app/models/principals/commune.dart';
import 'package:jenos_app/models/principals/user.dart';

class ProfilePageState {
  bool edit;
  User? user;
  bool isLoad;
  bool error;
  bool hasData;
  bool isVisible;
  List<Commune> communes;
  Commune? commune;
  ProfilePageState(
      {this.edit = true, this.hasData = false, this.isVisible = false, this.commune, this.communes = const [], this.user, this.isLoad = false, this.error = false});

  ProfilePageState copyWith(
          {bool? edit, User? user, bool? isLoad, bool? error}) =>
      ProfilePageState(
        edit: edit ?? this.edit,
        user: user ?? this.user,
        isLoad: isLoad ?? this.isLoad,
        error: error ?? this.error
      );
}
