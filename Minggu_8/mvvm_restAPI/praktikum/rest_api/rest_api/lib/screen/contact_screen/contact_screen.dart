import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/screen/contact_screen/contact_view_model.dart';
import 'package:rest_api/screen/put_request/put_request_screen.dart';
import 'package:rest_api/widget/button_widget.dart';
import 'package:rest_api/widget/input_textfield.dart';

final dio = Dio();

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    final ProviderContact =
        Provider.of<ContactViewModel>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Contact API"),
          centerTitle: true,
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 50,
            ),
            InputTextField(
              label: "Name",
              hintText: "Input Your Name",
              controller: ProviderContact.nameController,
            ),
            const SizedBox(
              height: 30,
            ),
            InputTextField(
              label: "Phone",
              hintText: "Input Your Phone",
              controller: ProviderContact.phoneController,
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(
              title: "POST DATA",
              onPressed: () {
                ProviderContact.postData();
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(
              title: "GET DATA 2",
              onPressed: () {
                ProviderContact.getContact();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: const EdgeInsets.all(20),
                        title: const Text('Data Contact 2'),
                        content: Consumer<ContactViewModel>(
                          builder: (BuildContext context,
                                  ContactViewModel value, Widget? child) =>
                              value.data2.id == 2
                                  ? SizedBox(
                                      width: double.minPositive,
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: [
                                          Text(
                                              'ID : ${ProviderContact.data2.id}'),
                                          Text(
                                              'Name : ${ProviderContact.data2.name}'),
                                          Text(
                                              'Phone : ${ProviderContact.data2.phone}'),
                                        ],
                                      ),
                                    ):
                                  
                                  const Text('Mencari data')
                                  
                        ),
                        actions: [
                          ButtonWidget(
                            title: 'Close',
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(
              title: 'Put Request',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PutRequest();
                }));
              },
            )
          ],
        ));
  }
}
