import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/screen/dicebar/dicebear_view_model.dart';
import 'package:rest_api/widget/button_widget.dart';
import 'package:rest_api/widget/input_textfield.dart';

class DicebearScreen extends StatelessWidget {
  const DicebearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProviderDicebearListener = Provider.of<DicebearViewModel>(context);
    final ProviderDicebearNotListener =
        Provider.of<DicebearViewModel>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('DiceBear'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<DicebearViewModel>(
                    builder: (context, dicebearProvider, child) =>
                        dicebearProvider.GenerateImage.isEmpty
                            ? Image.network(
                                'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg',
                                width: 200,
                                height: 200,
                              )
                            : SvgPicture.string(
                                dicebearProvider.GenerateImage,
                                width: 200,
                                height: 200,
                              )),
                const SizedBox(
                  height: 24,
                ),
                InputTextField(
                  label: 'Image Style',
                  hintText: 'Image Style',
                  controller: ProviderDicebearNotListener.styleController,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputTextField(
                    label: 'Name',
                    hintText: 'Name',
                    controller: ProviderDicebearNotListener.seedController),
                const SizedBox(
                  height: 20,
                ),
                ProviderDicebearListener.isLoading
                    ? const CircularProgressIndicator()
                    : ButtonWidget(
                        title: 'Start',
                        onPressed: () {
                          ProviderDicebearNotListener.generateImage();
                        },
                      ),
              ],
            ),
          ),
        ));
  }
}
