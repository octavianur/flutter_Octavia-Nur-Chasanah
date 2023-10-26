import 'package:flutter/material.dart';
import 'package:open_ai/screen/Halaman_Hasil/halaman_hasil_screen.dart';
import 'package:open_ai/screen/Halaman_Utama/halaman_utama_view_model.dart';
import 'package:open_ai/widget/textfield_widget.dart';
import 'package:provider/provider.dart';

class HalamanUtamaScreen extends StatefulWidget {
  const HalamanUtamaScreen({super.key});

  @override
  State<HalamanUtamaScreen> createState() => _HalamanUtamaScreenState();
}

class _HalamanUtamaScreenState extends State<HalamanUtamaScreen> {
  @override
  Widget build(BuildContext context) {

  final halamanUtamaViewModel = Provider.of<HalamanUtamaViewModel>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Phone Recommendations',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
          child: Column(
            children: [
              TextFieldWidget(
                controller: halamanUtamaViewModel.budgetController,
                label: 'Budget',
                onChanged: (_) {
                  halamanUtamaViewModel.validateTextField();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldWidget(
                controller: halamanUtamaViewModel.cameraController,
                label: 'Camera (MP)',
                onChanged: (_) {
                  halamanUtamaViewModel.validateTextField();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldWidget(
                controller: halamanUtamaViewModel.internalStorageController,
                label: 'Internal Storage (GB)',
                onChanged: (_) {
                  halamanUtamaViewModel.validateTextField();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<HalamanUtamaViewModel>(
                builder: (context, value, child) => ElevatedButton(
                    onPressed: value.isValidated
                        ? () async {
                            final result =
                                await halamanUtamaViewModel.getPhoneReccomendation();
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HalamanHasilScreen(data: result)));
                          }
                        : null,
                    child: value.isLoading
                        ? Container(
                            padding: const EdgeInsets.all(16),
                            width: 50,
                            height: 50,
                            child: const CircularProgressIndicator())
                        : const Text('Get Recommendation')),
              ),
            ],
          ),
        ));
  }
}
