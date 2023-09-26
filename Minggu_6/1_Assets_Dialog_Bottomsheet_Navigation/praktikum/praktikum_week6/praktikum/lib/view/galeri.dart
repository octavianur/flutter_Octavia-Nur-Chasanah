import 'package:assets_dialog_bottomsheet_navigation/Modal/Widget-ElevatedButton.dart';
import 'package:assets_dialog_bottomsheet_navigation/Modal/list-image.dart';
import 'package:assets_dialog_bottomsheet_navigation/routes/routes.dart';
import 'package:flutter/material.dart';

class GaleriScreen extends StatelessWidget {
  const GaleriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Galeri with GridView"
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 169, 119, 178),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        itemCount: imageList.length, 
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: (){
              showBottomSheet(
                context: context, 
                builder: (BuildContext context){
                  return Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 500,
                          width: 500,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.asset(
                              imageList[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        buildWidgetElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            showDialog(
                              context: context, 
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text("Selected Image"),
                                  content: Image.asset(
                                    imageList[index],
                                    fit: BoxFit.cover,
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        buildWidgetElevatedButton(
                                          title: "Ya", 
                                          onPressed: (){
                                            Navigator.of(context).pop();
                                            Navigator.pushNamed(
                                              context, 
                                              RoutesNavigation.PhotoScreen,
                                              arguments: imageList[index]
                                            );
                                          }
                                        ),
                                        buildWidgetElevatedButton(
                                          title: "Tidak", 
                                          onPressed: (){
                                            Navigator.pop(context);
                                          }
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              }
                            );
                          }, 
                          title: 'Next',
                        ),
                      ],
                    ),
                  );
                }
              );
            },
            child: Image.asset(
              imageList[index],
              fit: BoxFit.cover,
            ),
          );
        }
      ),
    );
  }
}