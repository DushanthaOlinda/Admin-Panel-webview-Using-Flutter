import 'package:flutter/material.dart';
import 'package:responsive_admin_panel_dashboard/resource/app_colors.dart';
import 'package:responsive_admin_panel_dashboard/screen/feedback.dart';
import 'package:responsive_admin_panel_dashboard/screen/history.dart';
import 'package:responsive_admin_panel_dashboard/screen/panel_left_screen.dart';
import 'package:responsive_admin_panel_dashboard/screen/profile.dart';
import 'package:responsive_admin_panel_dashboard/screen/reports.dart';
import 'package:responsive_admin_panel_dashboard/widget/custom_app_bar.dart';

import '../resource/app_padding.dart';
import '../widget/responsive_layout.dart';
import '../widget_tree.dart';
import 'login.dart';

class ButtonsInfo {
  String title;
  IconData icon;

  ButtonsInfo({required this.title, required this.icon});
}

List<ButtonsInfo> _buttonInfo = [
  ButtonsInfo(title: "Dashboard", icon: Icons.home),
  ButtonsInfo(title: "Profiles", icon: Icons.person),
  ButtonsInfo(title: "Reports", icon: Icons.report),
  ButtonsInfo(title: "History Orders", icon: Icons.history),
  ButtonsInfo(title: "Feedback", icon: Icons.feedback),
  ButtonsInfo(title: "Logout", icon: Icons.logout),
];

int _currentIndex = 0;

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.P10),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  'Admin Menu',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: !ResponsiveLayout.isComputer(context)
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close, color: Colors.white))
                    : null,
              ),
              ...List.generate(
                  _buttonInfo.length,
                  (index) => Column(
                        children: [
                          Container(
                            decoration: index == _currentIndex
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(colors: [
                                      AppColors.red.withOpacity(0.9),
                                      AppColors.orange.withOpacity(0.9),
                                    ]))
                                : null,
                            child: ListTile(
                              title: Text(
                                _buttonInfo[index].title,
                                style: const TextStyle(color: Colors.white),
                              ),
                              leading: Padding(
                                padding: const EdgeInsets.all(AppPadding.P10),
                                child: Icon(
                                  _buttonInfo[index].icon,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  _currentIndex = index;
                                });
                                if (index==0) {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => WidgetTree()));
                                }
                                else if(index==1){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Profile()
                                  ));
                                }
                                else if(index == 2) {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context)=> Reports()
                                  ));
                                }
                                else if(index == 3) {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context)=> History()
                                  ));
                                }
                                else if(index == 4) {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context)=> FeedBack()
                                  ));
                                }
                                else if(index == 5) {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context)=> const LoginDemo()
                                  ));
                                }
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 0.1,
                          ),
                        ],
                      )
                      )
            ],
          ),
        ),
      ),
    );
  }
}
