class ProfilePageState {
  bool edit;

  ProfilePageState({this.edit = false});

  ProfilePageState copyWith({bool? edit}) =>
      ProfilePageState(edit: edit ?? this.edit);
}
