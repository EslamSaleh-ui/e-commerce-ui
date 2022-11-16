import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/widgets/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,home:  MyApp()));
}