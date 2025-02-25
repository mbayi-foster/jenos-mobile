import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';

class Chargement extends StatefulWidget {
  final bool loading;
  final bool hasData;
  const Chargement({super.key, this.loading = true, this.hasData = false});

  @override
  State<Chargement> createState() => _ChargementState();
}

class _ChargementState extends State<Chargement> {
  @override
  Widget build(BuildContext context) {

    return Visibility(
      visible: (widget.loading || widget.hasData) ? true : false,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20.00),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.loading)
                const CircularProgressIndicator(
                  color: MyColors.primary,
                  value: 20.0,
                ),
              if (widget.loading)
                const Text(
                  "Chargement...",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.00, color: Colors.black54),
                ),
              if (!widget.loading && !widget.hasData)
                const Text(
                  "Aucune donnée trouvée vérifiez votre connexion ou actualiser la page",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.00, color: Colors.black54),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
