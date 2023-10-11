import 'package:assets_dialog_bottomsheet_navigation/bloc/form_phone/form_phone_bloc.dart';
import 'package:assets_dialog_bottomsheet_navigation/bloc/form_submit/form_submit_event.dart';
import 'package:assets_dialog_bottomsheet_navigation/bloc/form_submit/form_submit_state.dart';
import 'package:assets_dialog_bottomsheet_navigation/screen/contact/widget/headerContactScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/form_name/form_name_bloc.dart';
import '../../bloc/form_submit/form_submit_bloc.dart';
import '../../constants/color_style.dart';
import '../../constants/text_style.dart';
import '../../modal/contact_model.dart';
import '../../widget/buttonWidget.dart';
import '../../widget/input_textfield.dart';

// ignore: must_be_immutable
class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});
  int selectedIndex = -1;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<ContactModel> contactModel = [
    ContactModel(
      name: '',
      phone: '',
    )
  ];
  @override
  Widget build(BuildContext context) {
    final currentNameBloc = context.watch<FormNameBloc>().state;
    final currentPhoneBloc = context.watch<FormPhoneBloc>().state;

    final FormvalidateNameBloc = context.read<FormNameBloc>();
    final FormValidarePhoneBloc = context.read<FormPhoneBloc>();
    final FormValidateSubmitBloc = context.read<FormSubmitBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: [
          const HeaderContactPage(),
          BlocBuilder<FormNameBloc, FormNameState>(
            builder: (context, state) {
              return InputTextField(
                label: "Nama",
                hintText: "Insert Your Name",
                controller: nameController,
                errorText: FormvalidateNameBloc.state.message,
                onChanged: (value) {
                  FormvalidateNameBloc.add(FormInputNameEvent(value: value));
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          InputTextField(
            label: "Nomor",
            hintText: "+62..",
            keyboardType: TextInputType.number,
            controller: phoneController,
            errorText: FormValidarePhoneBloc.state.message,
            onChanged: (value) {
              FormValidarePhoneBloc.add(FormInputPhoneEvent(value: value));
            },
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                    title: 'Submit',
                    onPressed: () {
                      if (selectedIndex == -1) {
                        FormValidateSubmitBloc.add(CreateContact(
                            name: nameController.text,
                            phone: phoneController.text));
                        nameController.clear();
                        phoneController.clear();
                        FormvalidateNameBloc.add(ResetNameValue());
                        FormValidarePhoneBloc.add(ResetPhoneValue());
                      } else {
                        FormValidateSubmitBloc.add(UpdateContact(
                            name: nameController.text,
                            phone: phoneController.text,
                            index: selectedIndex));
                        nameController.clear();
                        phoneController.clear();
                        selectedIndex = -1;
                      }
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 49,
          ),
          Text(
            "List Contacts",
            style: ThemeTextStyle()
                .headlineSmall
                .copyWith(color: ColorStyle().m3SysLightOnSufrace),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
            ),
            child: BlocBuilder<FormSubmitBloc, FormSubmitMessageState>(
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.contactList.length,
                  itemBuilder: (context, index) {
                    var data = state.contactList[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            ColorStyle().m3SysLightPrimaryContainer,
                        child: Text(
                          data.name.substring(0, 1),
                          style: ThemeTextStyle().titleMedium.copyWith(
                              color: ColorStyle().m3SysLightOnPrimaryContainer),
                        ),
                      ),
                      title: Text(
                        data.name,
                        style: ThemeTextStyle()
                            .bodyLarge
                            .copyWith(color: ColorStyle().m3SysLightOnSufrace),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.phone,
                            style: ThemeTextStyle().bodyMedium.copyWith(
                                color: ColorStyle().m3SysLightOnSufraceVariant),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                selectedIndex = index;
                                nameController.text = data.name;
                                phoneController.text = data.phone;
                                FormvalidateNameBloc.add(UpdateNameValue(selectedName: data.name));
                                FormValidarePhoneBloc.add(UpdatePhoneValue(selectedPhone: data.phone));
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                            onPressed: () {
                              FormValidateSubmitBloc.add(DeleteContact(id: index));
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
