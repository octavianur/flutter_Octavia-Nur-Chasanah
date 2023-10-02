import 'package:assets_dialog_bottomsheet_navigation/modal/listImage_model.dart.dart';
import 'package:assets_dialog_bottomsheet_navigation/routes/routes.dart';
import 'package:assets_dialog_bottomsheet_navigation/widget/drawer.dart';
import 'package:assets_dialog_bottomsheet_navigation/widget/elevatedButtonWidget.dart.dart';
import 'package:flutter/material.dart';

class GaleriScreen extends StatefulWidget {
  const GaleriScreen({super.key});

  @override
  _GaleriScreenState createState() => _GaleriScreenState();
}

class _GaleriScreenState extends State<GaleriScreen> {
  String selectedImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galeri with GridView"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 169, 119, 178),
      ),
      drawer: buildDrawer(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedImage = imageList[index];
              });

              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 350,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              child: Image.asset(
                                selectedImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          buildWidgetElevatedButton(
                            title: "Next",
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Close the bottom sheet
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Selected Image"),
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          selectedImage,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          buildWidgetElevatedButton(
                                            title: "Ya",
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the AlertDialog
                                              Navigator.pushNamed(
                                                context,
                                                RoutesNavigation.PhotoScreen,
                                                arguments: selectedImage,
                                              ); // Navigate to the new page
                                            },
                                          ),
                                          buildWidgetElevatedButton(
                                            title: "Tidak",
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the AlertDialog
                                              // You can add any additional logic here for "Tidak"
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Image.asset(
              imageList[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
