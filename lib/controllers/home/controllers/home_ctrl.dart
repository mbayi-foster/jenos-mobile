import 'package:get/get.dart';
import 'package:jenos_app/controllers/home/states/home_page_state.dart';
import 'package:jenos_app/models/principals/plat.dart';

class HomeCtrl extends GetxController {
  HomePageState state = HomePageState();

  void fetchData(){
    List<Plat?> platRecents = [];
    List<Plat?> platPops = [];
    List<Plat?> platMostPops = [];
  }
}
