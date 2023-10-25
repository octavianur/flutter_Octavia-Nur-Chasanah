import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/screen/put_request/put_request_view_model.dart';
import 'package:rest_api/widget/button_widget.dart';
import 'package:rest_api/widget/input_textfield.dart';

class PutRequest extends StatefulWidget {
  const PutRequest({super.key});

  @override
  State<PutRequest> createState() => _PutRequestState();
}

class _PutRequestState extends State<PutRequest> {
  @override
  Widget build(BuildContext context) {
    final ProviderRequest =
        Provider.of<RequestViewmodel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Put Request'),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          InputTextField(
            label: 'ID',
            hintText: 'Input ID',
            controller: RequestViewmodel().idController,
          ),
          const SizedBox(
            height: 20,
          ),
          InputTextField(
            label: 'Title',
            hintText: 'Input Title',
            controller: ProviderRequest.titleController,
          ),
          const SizedBox(
            height: 20,
          ),
          InputTextField(
            label: 'Body',
            hintText: 'Input Body',
            controller: ProviderRequest.bodyController,
          ),
          const SizedBox(
            height: 20,
          ),
          InputTextField(
            label: 'User ID',
            hintText: 'Input User ID',
            controller: ProviderRequest.userIdController,
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            title: 'Put Data 1',
            onPressed: () {
             ProviderRequest.updateData();
            },
          )
        ],
      ),
    );
  }
}
