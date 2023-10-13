import 'package:flutter/material.dart';
import 'package:project/constants/color_style.dart';
import 'package:project/constants/text_style.dart';
import 'package:project/routes/routes.dart';

class buildDrawer extends StatelessWidget {
  const buildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorStyle().bluePrimary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'FindFluence',
                    style: ThemeTextStyle().headlineLarge,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RoutesNavigation.LoginPage,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Contact'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RoutesNavigation.ContactPage,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.note),
            title: Text('About Us'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RoutesNavigation.AboutPage,
              );
            },
          ),
        ],
      ),
    );
  }
}
