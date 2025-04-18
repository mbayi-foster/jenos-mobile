import 'package:jenos_app/models/principals/place.dart';
import 'package:jenos_app/models/principals/user.dart';

class CheckoutPageState {
  Place? adresse;
  String paiement;
  String note;
  double prix;
  List<int> paniers;
  double deliveryCoast;
  User? user;

  CheckoutPageState(
      {this.adresse,
      this.paiement = 'cash',
      this.note = "",
      this.prix = 0.0,
      this.deliveryCoast = 0.0,
      this.paniers = const [],
      this.user});
}
