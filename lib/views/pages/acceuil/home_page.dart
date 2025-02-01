import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/views/components/offres.dart';
import 'package:jenos_app/views/components/plats.dart';
import 'package:jenos_app/views/components/plats_pop.dart';
import 'package:jenos_app/views/components/text_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List plats = [1, 2, 3, 4, 5, 6, 7];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: TextTitle(title: "Bonjour Rolly !"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_basket))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [_offres(), _platPop(width), _platMostPop(width)],
        ),
      ),
    );
  }

  _offres() {
    return Container(
      height: 150, // Hauteur fixe pour le ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Offres(
                offre: "items $index",
                tap: () {},
              ),
              SizedBox(
                width: 25,
              )
            ],
          );
        },
      ),
    );
  }

  _platPop(width) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.00),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextTitle(title: "Plats populaire"),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Voir tout",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: MyColors.primary),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 16.00,
        ),
        for (var i = 0; i < 5; i++) Plats(tap: () {})
      ],
    );
  }

  _platMostPop(width) {
    double _width = width * 0.65;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.00),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextTitle(title: "Les plus populaire"),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Voir tout",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: MyColors.primary),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 16.00,
        ),
        Container(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  PlatsPop(
                    fit: BoxFit.cover,
                    heigth: 125,
                    width: _width,
                    offre: "items $index",
                    tap: () {},
                  ),
                  SizedBox(
                    width: 25,
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
