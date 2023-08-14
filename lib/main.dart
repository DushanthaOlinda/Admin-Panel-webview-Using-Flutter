import 'package:flutter/material.dart';
import 'package:responsive_admin_panel_dashboard/screen/login.dart';

import 'resource/app_colors.dart';
import 'widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.purpleDark,
          primarySwatch: Colors.blue,
          canvasColor: AppColors.purpleDark),
      home: LoginDemo(),
    );
  }
}
