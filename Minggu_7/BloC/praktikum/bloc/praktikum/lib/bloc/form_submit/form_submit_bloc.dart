import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modal/contact_model.dart';
import 'form_submit_event.dart';
import 'form_submit_state.dart';

class FormSubmitBloc extends Bloc<FormSubmitEvent, FormSubmitMessageState> {
  FormSubmitBloc() : super(const FormSubmitInitial(contactList: [])) {
    on<CreateContact>((event, emit) {
      List<ContactModel> contactList = List.from(state.contactList);

      contactList.add(ContactModel(
          name: event.name,
          phone: event.phone,
          ));

      emit(CreateContactSuccess(contactList: contactList));
    });

    on<DeleteContact>((event, emit) {
      List<ContactModel> contactListAfterDelete = List.from(state.contactList);

      contactListAfterDelete.removeAt(event.id);

      emit(DeleteContactSuccess(contactList: contactListAfterDelete));
    });

    on<UpdateContact>((event, emit) {
      List<ContactModel> contactListAfterUpdate = List.from(state.contactList);

      contactListAfterUpdate[event.index] = ContactModel(
          name: event.name,
          phone: event.phone,
          );

      emit(UpdateContactSuccess(contactList: contactListAfterUpdate));
    });
  }
}