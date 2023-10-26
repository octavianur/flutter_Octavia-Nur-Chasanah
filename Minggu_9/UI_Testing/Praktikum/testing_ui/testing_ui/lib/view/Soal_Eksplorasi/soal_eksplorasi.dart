import 'package:advance_form/model/theme/text_style.dart';
import 'package:advance_form/model/widget/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

class GaleriScreen extends StatelessWidget {
  const GaleriScreen({super.key});

  final List<String> imageList = const [
    'assets/images/content.png',
    'assets/images/contract.png',
    'assets/images/edit-profile.png',
    'assets/images/modal-tambahan.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Text('Picturess', style: ThemeTextStyle().headlineLarge),
                const SizedBox(height: 12),
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: 4,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                context: context,
                                builder: (context) => BottomSheetWidget(
                                    imageAdress: imageList[index]));
                          },
                          child: Container(
                              color: Colors.blue.withOpacity(0.5),
                              child: Image.asset(imageList[index],
                                  fit: BoxFit.fill)),
                        ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
