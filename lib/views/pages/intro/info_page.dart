import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/views/components/primary_button.dart';
import 'package:jenos_app/views/pages/intro/intro_page.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final PageController _controller = PageController();
  final List<Map<String, String>> _content = [
    {
      'image': 'assets/images/01.png',
      'nom': 'Find Food You Love',
      'text': 'Découvrez les meilleurs plats de plus de 1000 restaurants!',
    },
    {
      'image': 'assets/images/image2.png',
      'nom': 'Find Food You Love',
      'text': 'Profitez d\'une livraison rapide à votre porte!',
    },
    {
      'image': 'assets/images/image3.png',
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
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => IntroPage(), // Remplacez par votre page suivante
      ));
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
                  padding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: width * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://cdn.pixabay.com/photo/2023/10/17/11/18/beetle-8320899_960_720.jpg'),
                      SizedBox(height: 50),
                      Text(
                        _content[index]['nom']!,
                        style: TextStyle(
                            fontSize: 30.00,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                      SizedBox(height: 20),
                      Text(
                        _content[index]['text']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: width * 0.30),
            child: PrimaryButton(onPressed: _nextPage, fontSize: width * 0.06, padding: width * 0.35, title: "Suivant"),
          ),
        ],
      ),
    );
  }
}
