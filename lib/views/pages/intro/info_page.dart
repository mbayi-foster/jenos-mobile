import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/views/components/primary_button.dart';
import 'package:jenos_app/views/components/text_title.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final PageController _controller = PageController();
  final List<Map<String, String>> _content = [
    {
      'image': ImagePaths.info1,
      'nom': 'Find Food You Love',
      'text': 'Découvrez les meilleurs plats de plus de 1000 restaurants!',
    },
    {
      'image': ImagePaths.info2,
      'nom': 'Find Food You Love',
      'text': 'Profitez d\'une livraison rapide à votre porte!',
    },
    {
      'image': ImagePaths.info3,
      'nom': 'Find Food You Love',
      'text': 'Trouvez des plats que vous aimez!',
    },
  ];

  int _currentIndex = 0;

  void _nextPage() {
    if (_currentIndex < _content.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Naviguer vers la page suivante
      Get.toNamed("/enter");
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentIndex = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _content.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.05, right: width * 0.05, top: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(_content[index]['image']!),
                      SizedBox(height: 50),
                      TextTitle(title: _content[index]['nom']!),
                      SizedBox(height: 20),
                      Text(
                        _content[index]['text']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.0375,
                right: width * 0.0375,
                bottom: width * 0.1),
            child: PrimaryButton(
                onPressed: _nextPage,
                fontSize: width * 0.06,
                padding: width * 0.35,
                title: "Suivant"),
          ),
        ],
      ),
    );
  }
}
