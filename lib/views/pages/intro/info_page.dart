import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/images_path.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart';
import 'package:jenos_app/views/components/buttons/primary_button.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';

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
      'nom': "info.title1",
      'text': "info.mot1",
    },
    {
      'image': ImagePaths.info2,
      'nom': "info.title2",
      'text': "info.mot2",
    },
    {
      'image': ImagePaths.info3,
      'nom': "info.title3",
      'text': "info.mot3",
    },
  ];

  int _currentIndex = 0;

  void _nextPage() {
    if (_currentIndex < _content.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
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
                      const SizedBox(height: 50),
                      TextTitle(
                          title: LocalisationService.of(context)!
                              .translate(_content[index]['nom']!)),
                      const SizedBox(height: 20),
                      Text(
                        LocalisationService.of(context)!
                            .translate(_content[index]['text']!),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
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
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: PrimaryButton(
              onPressed: _nextPage,
              title: LocalisationService.of(context)!.translate("info.btn"),
            ),
          ),
        ],
      ),
    );
  }
}
