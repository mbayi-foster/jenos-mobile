import 'package:jenos_app/models/principals/plat.dart';

class SearchPageState {
  bool loading;
  bool hasData;
  bool isVisible;
  bool autoFocus;
  List<Plat> plats;

  SearchPageState(
      {this.autoFocus = false,
      this.hasData = false,
      this.loading = false,
      this.isVisible = false,
      this.plats = const []});

  SearchPageState copyWith(bool? autoFocus, bool? hasData, bool? loading,
          bool? isVisible, List<Plat>? plats) =>
      SearchPageState(
          autoFocus: autoFocus ?? this.autoFocus,
          hasData: hasData ?? this.hasData,
          loading: loading ?? this.loading,
          isVisible: isVisible ?? this.isVisible,
          plats: plats ?? this.plats);
}
