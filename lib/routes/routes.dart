import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/views/pages/intro/access_page.dart';
import 'package:jenos_app/views/pages/intro/info_page.dart';
import 'package:jenos_app/views/pages/intro/intro_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String detail = '/detail';

  static final routes = [GetPage(name: '/', page: (() => AccessPage()))];
}


