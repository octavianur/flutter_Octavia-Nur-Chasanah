import 'package:assets_dialog_bottomsheet_navigation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:assets_dialog_bottomsheet_navigation/constants/color_style.dart';
import 'package:assets_dialog_bottomsheet_navigation/constants/text_style.dart';

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
              color: const Color.fromARGB(255, 169, 119, 178),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Menu',
                  style: ThemeTextStyle()
                      .displayMedium
                      .copyWith(color: ColorStyle().m3SysLightOnSufrace),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Halaman pada aplikasi ini',
                  style: ThemeTextStyle()
                      .bodyMedium
                      .copyWith(color: ColorStyle().m3SysLightOnPrimary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Contact'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RoutesNavigation.ContactScreen,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                RoutesNavigation.GaleriScreen,
              );
            },
          ),
        ],
      ),
    );
  }
}
