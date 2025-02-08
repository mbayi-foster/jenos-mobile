import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/utils/icons_path.dart';

class MyFloatingButton extends StatefulWidget {
  final int index;
  const MyFloatingButton({super.key, this.index = -1});

  @override
  State<MyFloatingButton> createState() => _MyFloatingButtonState();
}

class _MyFloatingButtonState extends State<MyFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: widget.index == -1 ? MyColors.primary : Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ImageIcon(
          AssetImage(IconsPath.home),
          color: Colors.white,
        ),
      ),
      onPressed: () {
        Get.toNamed('/home');
      },
    );
  }
}
