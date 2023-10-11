import 'package:equatable/equatable.dart';

import '../../modal/contact_model.dart';

sealed class FormSubmitMessageState extends Equatable {
  final List<ContactModel> contactList;

  const FormSubmitMessageState({required this.contactList});

  @override
  List<Object> get props => [contactList];
}

final class FormSubmitInitial extends FormSubmitMessageState {
  const FormSubmitInitial({required super.contactList});
}


final class CreateContactSuccess extends FormSubmitMessageState {
  const CreateContactSuccess({required super.contactList});
}

final class CreateContactFailed extends FormSubmitMessageState {
  const CreateContactFailed({required super.contactList});
}



final class UpdateContactSuccess extends FormSubmitMessageState {
  const UpdateContactSuccess({required super.contactList});
}

final class UpdateContactFailed extends FormSubmitMessageState {
  const UpdateContactFailed({required super.contactList});
}



final class DeleteContactSuccess extends FormSubmitMessageState {
  const DeleteContactSuccess({required super.contactList});
}

final class DeleteContactFailed extends FormSubmitMessageState {
  const DeleteContactFailed({required super.contactList});
}
