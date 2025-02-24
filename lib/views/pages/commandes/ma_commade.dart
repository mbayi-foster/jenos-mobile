import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

class MaCommade extends StatefulWidget {
  const MaCommade({super.key});

  @override
  State<MaCommade> createState() => _MaCommadeState();
}

class _MaCommadeState extends State<MaCommade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextTitle(title: "Ma Commande"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _plats(),
            SizedBox(
              height: 30,
            ),
            _prix(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryButton(
                onPressed: () {},
                title: "Checker",
                padding: 23,
              ),
            )
          ],
        ),
      ),
    );
  }

  _plats() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(children: [
          for (var i = 0; i < 4; i++)
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Beef Buerger x2", style: TextStyle(fontSize: 17.5)),
                      Text(
                        '\$16',
                        style: TextStyle(
                            fontSize: 17.5, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.00,
                  ),
                  Container(
                    height: 0.75,
                    color: Colors.black45,
                  ),
                  SizedBox(
                    height: 20.00,
                  ),
                ],
              ),
            ),
        ]),
      ),
    );
  }

  _prix() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Instruction de livraisons',
                style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "+ Ajouter",
                  style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w400,
                      color: MyColors.primary),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.00),
          Container(
            height: 0.75,
            color: Colors.black45,
          ),
          SizedBox(height: 20.00),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Prix total',
                style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$68",
                style: TextStyle(
                    fontSize: 17.5,
                    fontWeight: FontWeight.w400,
                    color: MyColors.primary),
              ),
            ],
          ),
          SizedBox(
            height: 20.00,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Frais de livraison',
                style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$2",
                style: TextStyle(
                    fontSize: 17.5,
                    fontWeight: FontWeight.w400,
                    color: MyColors.primary),
              ),
            ],
          ),
          SizedBox(
            height: 20.00,
          ),
          Container(
            height: 1,
            color: Colors.black45,
          ),
          SizedBox(
            height: 20.00,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$2",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
