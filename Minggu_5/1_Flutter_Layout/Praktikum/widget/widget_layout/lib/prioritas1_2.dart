import 'package:flutter/material.dart';
import 'package:widget_layout/data.dart';

class HalamanDua extends StatelessWidget {
  final List<UserData> userDataList = [
    UserData(username: "PurplePenguin22", phone: "(555) 123-4567"),
    UserData(username: "GreenGiraffe99", phone: "(555) 234-5678"),
    UserData(username: "SilverSunshine11", phone: "(555) 345-6789"),
    UserData(username: "BlueButterfly44", phone: "(555) 456-7890"),
    UserData(username: "GoldenDragonfly77", phone: "(555) 567-8901"),
    UserData(username: "RedRainbow66", phone: "(555) 678-9012"),
    UserData(username: "OrangeMeadow55", phone: "(555) 789-0123"),
    UserData(username: "YellowNightfall33", phone: "(555) 890-1234"),
    UserData(username: "BlackStarlight88", phone: "(555) 901-2345"),
    UserData(username: "PinkMoonstone77", phone: "(555) 012-3456"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: userDataList.length,
        itemBuilder: (context, index) {
          final user = userDataList[index];
          final initialLetter = user.username[0].toUpperCase(); 

          return ListTile(
            leading: CircleAvatar(
              child: Text(initialLetter),
            ),
            title: Text(user.username),
            subtitle: Text(user.phone),
          );
        },
      ),
    );
  }
}
